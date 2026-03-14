-- =========================
-- COMENTÁRIOS DAS TABELAS
-- =========================

-- Descricao;;visible;;ordem;;

COMMENT ON TABLE "driver" IS '#Motorista;;true;;1;;';
COMMENT ON TABLE "driver_payment" IS '#Pagamento do motorista;;true;;2;;';
COMMENT ON TABLE "travel" IS '#Viagem;;true;;3;;';
COMMENT ON TABLE "travel_customer" IS '#Cliente da viagem;;true;;4;;';
COMMENT ON TABLE "travel_billing" IS '#Faturamento da viagem;;true;;5;;';
COMMENT ON TABLE "vehicle" IS '#Veículo;;true;;6;;';
COMMENT ON TABLE "vehicle_maintenance" IS '#Manutenção do veículo;;true;;7;;';
COMMENT ON TABLE "vehicle_refueling" IS '#Abastecimento do veículo;;true;;8;;';
COMMENT ON TABLE "phone" IS '#Telefone;;true;;9;;';
COMMENT ON TABLE "address" IS '#Endereço;;true;;10;;';
COMMENT ON TABLE "users" IS '#Usuário;;false;;0;;';
COMMENT ON TABLE "fuel_type" IS '#Tipo de combustível;;false;;0;;';
COMMENT ON TABLE "color" IS '#Cor;;false;;0;;';
COMMENT ON TABLE "state" IS '#Estado;;false;;0;;';
COMMENT ON TABLE "city" IS '#Cidade;;false;;0;;';
COMMENT ON TABLE "driver_phone" IS '#Relacionamento entre motorista e telefone;;false;;0;;';
COMMENT ON TABLE "driver_address" IS '#Relacionamento entre motorista e endereço;;false;;0;;';
COMMENT ON TABLE "travel_driver" IS '#Relacionamento entre viagem e motorista;;false;;0;;';
COMMENT ON TABLE "travel_truck_unloading" IS '#Ponto de descarga da viagem;;false;;0;;';
COMMENT ON TABLE "user_address" IS '#Relacionamento entre usuário e endereço;;false;;0;;';
COMMENT ON TABLE "user_phone" IS '#Relacionamento entre usuário e telefone;;false;;0;;';

-- =========================
-- TABELA: user
-- =========================

-- #Descrição*;;obrigatorio*;;front-ignore*;;editavel*;;visivel*;;table-only*;;dropdown*;;[dropdown_values separado por ,]*;;dropdown-table;;dropdown_id_column;;dropdown_name_column
--

-- =========================
-- TABELA: user
-- =========================
COMMENT ON COLUMN "users".id_user IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "users".email IS '#E-mail;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "users".password IS '#Senha criptografada;;true;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "users".name IS '#Nome completo;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "users".last_access IS '#Último acesso;;false;;true;;false;;true;;true;;false;;[]';
COMMENT ON COLUMN "users".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "users".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "users".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: fuel_type
-- =========================
COMMENT ON COLUMN "fuel_type".id_fuel_type IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "fuel_type".name IS '#Nome;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "fuel_type".abbreviation IS '#Abreviação;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "fuel_type".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "fuel_type".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "fuel_type".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: color
-- =========================
COMMENT ON COLUMN "color".id_color IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "color".color_name IS '#Nome;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "color".red_color IS '#RGB - Vermelho;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "color".green_color IS '#RGB - Verde;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "color".blue_color IS '#RGB - Azul;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "color".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "color".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "color".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: state
-- =========================
COMMENT ON COLUMN "state".id_state IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "state".name IS '#Nome;;true;;false;;false;;true;;false;;false;;[]';
COMMENT ON COLUMN "state".acronym IS '#Sigla;;true;;false;;false;;true;;false;;false;;[]';
COMMENT ON COLUMN "state".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "state".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "state".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: city
-- =========================
COMMENT ON COLUMN "city".id_city IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "city".id_state IS '#Estado;;true;;false;;false;;true;;false;;true;;[];;state;;id_state;;name';
COMMENT ON COLUMN "city".name IS '#Nome;;true;;false;;false;;true;;false;;false;;[]';
COMMENT ON COLUMN "city".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "city".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "city".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: phone
-- =========================
COMMENT ON COLUMN "phone".id_phone IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "phone".id_user IS '#Usuário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "phone".country_code IS '#DDI;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "phone".area_code IS '#DDD;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "phone".number IS '#Número;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "phone".is_main IS '#Principal;;true;;false;;true;;true;;false;;true;;[Sim,Não]';
COMMENT ON COLUMN "phone".active IS '#Ativo;;true;;false;;true;;true;;false;;true;;[Ativo,Inativo]';
COMMENT ON COLUMN "phone".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "phone".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "phone".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: driver
-- =========================
COMMENT ON COLUMN "driver".id_driver IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "driver".name IS '#Nome completo;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".cpf IS '#CPF;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".rg IS '#RG;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".birth_date IS '#Nascimento;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".email IS '#E-mail;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".license_number IS '#Nº CNH;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".license_category IS '#Categoria CNH;;true;;false;;true;;true;;false;;true;;[A,B,C,D,E,AB,AC,AD,AE]';
COMMENT ON COLUMN "driver".license_expiration IS '#Vencimento CNH;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".driver_salary IS '#Salário;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".driver_type IS '#Tipo vínculo;;true;;false;;true;;true;;false;;true;;[CLT,Autônomo,Terceirizado,Pessoa Jurídica]';
COMMENT ON COLUMN "driver".salary_date_payment IS '#Data pgto. salário;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver".status IS '#Status;;true;;false;;true;;true;;true;;true;;[Ativo,Inativo,Afastado,De férias]';
COMMENT ON COLUMN "driver".active IS '#Ativo;;true;;false;;true;;true;;false;;true;;[Sim,Não]';
COMMENT ON COLUMN "driver".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: driver_phone
-- =========================
COMMENT ON COLUMN "driver_phone".id_driver_phone IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_phone".id_driver IS '#Motorista;;true;;true;;false;;false;;false;;false;;[];;driver;;id_driver;;name';
COMMENT ON COLUMN "driver_phone".id_phone IS '#Telefone;;true;;true;;false;;false;;false;;false;;[];;phone;;id_phone;;number';
COMMENT ON COLUMN "driver_phone".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_phone".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_phone".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: driver_address
-- =========================
COMMENT ON COLUMN "driver_address".id_driver_address IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_address".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "driver_address".id_driver IS '#Motorista;;true;;true;;false;;false;;false;;false;;[];;driver;;id_driver;;name';
COMMENT ON COLUMN "driver_address".id_address IS '#Endereço;;true;;true;;false;;false;;false;;false;;[];;address;;id_address;;address';
COMMENT ON COLUMN "driver_address".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_address".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_address".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: driver_payment
-- =========================
COMMENT ON COLUMN "driver_payment".id_driver_payment IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_payment".id_travel IS '#Viagem;;false;;false;;true;;true;;false;;true;;[];;travel;;id_travel;;id_travel';
COMMENT ON COLUMN "driver_payment".id_driver IS '#Motorista;;true;;false;;true;;true;;false;;true;;[];;driver;;id_driver;;name';
COMMENT ON COLUMN "driver_payment".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "driver_payment".value IS '#Valor;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver_payment".date IS '#Data;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "driver_payment".payment_type IS '#Tipo pgto.;;true;;false;;true;;true;;false;;true;;[PIX,Transferência bancária,Dinheiro,Cheque,Cartão de débito,Cartão de crédito]';
COMMENT ON COLUMN "driver_payment".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_payment".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "driver_payment".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: vehicle
-- =========================
COMMENT ON COLUMN "vehicle".id_vehicle IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "vehicle".id_color IS '#Cor;;true;;false;;true;;true;;false;;true;;[];;color;;id_color;;name';
COMMENT ON COLUMN "vehicle".id_fueltype IS '#Combustível;;true;;false;;true;;true;;false;;true;;[];;fueltype;;id_fueltype;;name';
COMMENT ON COLUMN "vehicle".model IS '#Modelo;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".year_manufacture IS '#Ano fabricação;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".license_plate IS '#Placa;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".truck_body_volume IS '#Volume carroceria;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".average_fuel_consumption IS '#Consumo médio;;false;;false;;true;;true;;true;;false;;[]';
COMMENT ON COLUMN "vehicle".passengers IS '#Passageiros;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".renavam IS '#RENAVAM;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".chassis IS '#Chassi;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".gross_weight_tons IS '#PBT (ton);;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".number_of_axles IS '#Qtd. eixos;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".fuel_tank_capacity IS '#Cap. tanque;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".capacity_kg IS '#Cap. carga (kg);;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".status IS '#Status;;true;;false;;true;;true;;true;;true;;[Disponível,Em viagem,Em manutenção,Inativo,Vendido]';
COMMENT ON COLUMN "vehicle".license_expiration IS '#Venc. licenciamento;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".insurance_expiration IS '#Venc. seguro;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".inspection_expiration IS '#Venc. inspeção;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".antt_registration IS '#Registro ANTT;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".sold_value IS '#Valor venda;;false;;false;;true;;true;;true;;false;;[]';
COMMENT ON COLUMN "vehicle".current_odometer IS '#Odômetro atual;;false;;false;;true;;true;;true;;false;;[]';
COMMENT ON COLUMN "vehicle".trip_limit IS '#Limite km;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: vehicle_maintenance
-- =========================
COMMENT ON COLUMN "vehicle_maintenance".id_vehicle_maintenance IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "vehicle_maintenance".id_vehicle IS '#Veículo;;true;;false;;true;;true;;false;;true;;[];;vehicle;;id_vehicle;;model';
COMMENT ON COLUMN "vehicle_maintenance".maintenance_type IS '#Tipo;;true;;false;;true;;true;;false;;true;;[Preventiva,Corretiva,Preditiva,Revisão,Troca de óleo,Troca de pneu,Elétrica,Funilaria]';
COMMENT ON COLUMN "vehicle_maintenance".description IS '#Descrição;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".cost IS '#Custo;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".date IS '#Data;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".mileage IS '#KM;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".next_maintenance_date IS '#Próxima manutenção (data);;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".next_maintenance_mileage IS '#Próxima manutenção (km);;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".supplier IS '#Fornecedor/Oficina;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".status IS '#Status;;true;;false;;true;;true;;true;;true;;[Agendada,Em andamento,Concluída,Cancelada]';
COMMENT ON COLUMN "vehicle_maintenance".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_maintenance".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: vehicle_refueling
-- =========================
COMMENT ON COLUMN "vehicle_refueling".id_vehicle_refueling IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "vehicle_refueling".id_vehicle IS '#Veículo;;true;;false;;true;;true;;false;;true;;[];;vehicle;;id_vehicle;;model';
COMMENT ON COLUMN "vehicle_refueling".id_fuel_type IS '#Combustível;;true;;false;;true;;true;;false;;true;;[];;fueltype;;id_fueltype;;name';
COMMENT ON COLUMN "vehicle_refueling".id_travel IS '#Viagem;;false;;false;;true;;true;;false;;true;;[];;travel;;id_travel;;id_travel';
COMMENT ON COLUMN "vehicle_refueling".id_driver IS '#Motorista;;true;;false;;true;;true;;false;;true;;[];;driver;;id_driver;;name';
COMMENT ON COLUMN "vehicle_refueling".station IS '#Posto;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".refueling_date IS '#Data;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".liters IS '#Litros;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".price_per_liter IS '#Preço/litro;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".total_cost IS '#Custo total;;false;;false;;false;;true;;true;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".odometer IS '#Odômetro;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".full_tank IS '#Tanque cheio;;false;;false;;true;;true;;false;;true;;[Sim,Não]';
COMMENT ON COLUMN "vehicle_refueling".notes IS '#Observações;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".active IS '#Ativo;;true;;false;;true;;true;;false;;true;;[Ativo,Inativo]';
COMMENT ON COLUMN "vehicle_refueling".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "vehicle_refueling".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: travel_customer
-- =========================
COMMENT ON COLUMN "travel_customer".id_travel_customer IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_customer".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "travel_customer".name IS '#Nome;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_customer".document IS '#CPF/CNPJ;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_customer".email IS '#E-mail;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_customer".active IS '#Ativo;;true;;false;;true;;true;;false;;true;;[Ativo,Inativo]';
COMMENT ON COLUMN "travel_customer".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_customer".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_customer".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: travel
-- =========================
COMMENT ON COLUMN "travel".id_travel IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "travel".id_vehicle IS '#Veículo;;true;;false;;true;;true;;false;;true;;[];;vehicle;;id_vehicle;;model';
COMMENT ON COLUMN "travel".id_travel_customer IS '#Cliente;;true;;false;;true;;true;;false;;true;;[];;travel_customer;;id_travel_customer;;name';
COMMENT ON COLUMN "travel".travel_start_date IS '#Início;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".travel_end_date IS '#Término;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".return_empty_to_departure IS '#Retorno vazio;;false;;false;;true;;true;;false;;true;;[Sim,Não]';
COMMENT ON COLUMN "travel".total_mileage IS '#KM total;;false;;false;;false;;true;;true;;false;;[]';
COMMENT ON COLUMN "travel".start_odometer IS '#Odômetro inicial;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".end_odometer IS '#Odômetro final;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".truckload_description IS '#Descrição da carga;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".truckload_weight_kg IS '#Peso carga (kg);;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".contract_value IS '#Valor contrato;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".total_toll_cost IS '#Pedágios;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".other_expenses IS '#Outras despesas;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: travel_driver
-- =========================
COMMENT ON COLUMN "travel_driver".id_travel_driver IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_driver".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "travel_driver".id_travel IS '#Viagem;;true;;true;;false;;false;;false;;false;;[];;travel;;id_travel;;id_travel';
COMMENT ON COLUMN "travel_driver".id_driver IS '#Motorista;;true;;false;;true;;true;;false;;true;;[];;driver;;id_driver;;name';
COMMENT ON COLUMN "travel_driver".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_driver".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_driver".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: travel_truck_unloading
-- =========================
COMMENT ON COLUMN "travel_truck_unloading".id_travel_truck_unloading IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_truck_unloading".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "travel_truck_unloading".id_address IS '#Endereço descarga;;true;;false;;true;;true;;false;;true;;[];;address;;id_address;;address';
COMMENT ON COLUMN "travel_truck_unloading".id_travel IS '#Viagem;;true;;true;;false;;false;;false;;false;;[];;travel;;id_travel;;id_travel';
COMMENT ON COLUMN "travel_truck_unloading".unloading_order IS '#Ordem descarga;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_truck_unloading".expense IS '#Despesa;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_truck_unloading".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_truck_unloading".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_truck_unloading".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: address
-- =========================
COMMENT ON COLUMN "address".id_address IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "address".id_city IS '#Cidade;;true;;false;;true;;true;;false;;true;;[];;city;;id_city;;name';
COMMENT ON COLUMN "address".address IS '#Logradouro;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "address".number IS '#Número;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "address".complement IS '#Complemento;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "address".is_main IS '#Principal;;true;;false;;true;;true;;false;;true;;[Sim,Não]';
COMMENT ON COLUMN "address".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "address".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "address".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: user_address
-- =========================
COMMENT ON COLUMN "user_address".id_user_address IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "user_address".id_user IS '#Usuário;;true;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "user_address".id_address IS '#Endereço;;true;;true;;false;;false;;false;;false;;[];;address;;id_address;;address';
COMMENT ON COLUMN "user_address".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "user_address".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "user_address".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: travel_billing
-- =========================
COMMENT ON COLUMN "travel_billing".id_travel_billing IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".id_user IS '#Usuário proprietário;;false;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "travel_billing".id_travel IS '#Viagem;;true;;false;;false;;true;;false;;true;;[];;travel;;id_travel;;id_travel';
COMMENT ON COLUMN "travel_billing".issue_date IS '#Emissão;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".due_date IS '#Vencimento;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".value IS '#Valor;;true;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".status IS '#Status;;true;;false;;true;;true;;true;;true;;[Pendente,Pago,Vencido,Cancelado]';
COMMENT ON COLUMN "travel_billing".payment_date IS '#Data pgto.;;false;;false;;true;;true;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".received_value IS '#Valor recebido;;false;;false;;true;;true;;true;;false;;[]';
COMMENT ON COLUMN "travel_billing".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "travel_billing".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';

-- =========================
-- TABELA: user_phone
-- =========================
COMMENT ON COLUMN "user_phone".id_user_phone IS '#ID único;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "user_phone".id_user IS '#Usuário;;true;;true;;false;;false;;false;;false;;[];;user;;id_user;;name';
COMMENT ON COLUMN "user_phone".id_phone IS '#Telefone;;true;;true;;false;;false;;false;;false;;[];;phone;;id_phone;;number';
COMMENT ON COLUMN "user_phone".created_at IS '#Criação;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "user_phone".updated_at IS '#Atualização;;false;;true;;false;;false;;false;;false;;[]';
COMMENT ON COLUMN "user_phone".deleted_at IS '#Exclusão lógica;;false;;true;;false;;false;;false;;false;;[]';
