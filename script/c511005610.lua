--Wood Remains(DOR)
--Scripted by GameMaster(GM)
function c511005610.initial_effect(c)
--change code to wood remains -->17733394
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e0:SetCode(EFFECT_CHANGE_CODE)
	e0:SetRange(LOCATION_MZONE+LOCATION_GRAVE)
	e0:SetValue(17733394)
	c:RegisterEffect(e0)
	--flip effect & atkupdate of all skull servant currently on the field by 300 pts
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(511005610,0))
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_FLIP)
	e1:SetOperation(c511005610.operation)
	c:RegisterEffect(e1)
end
function c511005610.atktg(e,c)
	return c:GetFieldID()<=e:GetLabel() and c:IsCode(17733394)
end
function c511005610.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) and c:IsFaceup() then
		local g=Duel.GetFieldGroup(tp,LOCATION_MZONE,LOCATION_MZONE)
		local mg,fid=g:GetMaxGroup(Card.GetFieldID)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_FIELD)
		e1:SetCode(EFFECT_UPDATE_ATTACK)
		e1:SetRange(LOCATION_MZONE)
		e1:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
		e1:SetTarget(c511005610.atktg)
		e1:SetValue(500)
		e1:SetLabel(fid)
		e1:SetReset(RESET_EVENT+0x1ff0000)
		c:RegisterEffect(e1)
	end
end
	
	
--Scripter Notes:
--When this card is flipped face-up, all Skull Servants are increased by 300 points.
--The flip eff only works for original skull servants, this Anime Atk points wont update. So to overcome this problem, i've decided to adding Harpie Harpist eff (56585883) to Skull Servant DOR