-- =========================
-- TABELA: user
-- =========================
COMMENT ON TABLE "user" IS 'Usuário';

COMMENT ON COLUMN "user".id_user IS 'Identificador único do usuário';
COMMENT ON COLUMN "user".email IS 'E-mail do usuário';
COMMENT ON COLUMN "user".password IS 'Senha criptografada do usuário';
COMMENT ON COLUMN "user".name IS 'Nome completo do usuário';
COMMENT ON COLUMN "user".last_access IS 'Data e hora do último acesso';
COMMENT ON COLUMN "user".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "user".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "user".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: fuel_type
-- =========================
COMMENT ON TABLE "fuel_type" IS 'Tipo de combustível';

COMMENT ON COLUMN "fuel_type".id_fuel_type IS 'Identificador único do tipo de combustível';
COMMENT ON COLUMN "fuel_type".name IS 'Nome do tipo de combustível';
COMMENT ON COLUMN "fuel_type".abbreviation IS 'Abreviação do tipo de combustível';
COMMENT ON COLUMN "fuel_type".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "fuel_type".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "fuel_type".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: color
-- =========================
COMMENT ON TABLE "color" IS 'Cor';

COMMENT ON COLUMN "color".id_color IS 'Identificador único da cor';
COMMENT ON COLUMN "color".color_name IS 'Nome da cor';
COMMENT ON COLUMN "color".red_color IS 'Componente vermelho (RGB)';
COMMENT ON COLUMN "color".green_color IS 'Componente verde (RGB)';
COMMENT ON COLUMN "color".blue_color IS 'Componente azul (RGB)';
COMMENT ON COLUMN "color".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "color".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "color".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: state
-- =========================
COMMENT ON TABLE "state" IS 'Estado';

COMMENT ON COLUMN "state".id_state IS 'Identificador único do estado';
COMMENT ON COLUMN "state".name IS 'Nome do estado';
COMMENT ON COLUMN "state".acronym IS 'Sigla do estado';
COMMENT ON COLUMN "state".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "state".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "state".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: city
-- =========================
COMMENT ON TABLE "city" IS 'Cidade';

COMMENT ON COLUMN "city".id_city IS 'Identificador único da cidade';
COMMENT ON COLUMN "city".id_state IS 'Identificador do estado relacionado';
COMMENT ON COLUMN "city".name IS 'Nome da cidade';
COMMENT ON COLUMN "city".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "city".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "city".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: phone
-- =========================
COMMENT ON TABLE "phone" IS 'Telefone';

COMMENT ON COLUMN "phone".id_phone IS 'Identificador único do telefone';
COMMENT ON COLUMN "phone".id_user IS 'Identificador do usuário relacionado';
COMMENT ON COLUMN "phone".country_code IS 'Código do país';
COMMENT ON COLUMN "phone".area_code IS 'Código de área (DDD)';
COMMENT ON COLUMN "phone".number IS 'Número do telefone';
COMMENT ON COLUMN "phone".is_main IS 'Indica se é o telefone principal';
COMMENT ON COLUMN "phone".active IS 'Indica se o telefone está ativo';
COMMENT ON COLUMN "phone".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "phone".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "phone".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- ENUM: driver_type_enum
-- =========================
COMMENT ON TYPE "driver_type_enum" IS 'Tipo de vínculo do motorista';

-- =========================
-- ENUM: driver_status_enum
-- =========================
COMMENT ON TYPE "driver_status_enum" IS 'Status do motorista';

-- =========================
-- TABELA: driver
-- =========================
COMMENT ON TABLE "driver" IS 'Motorista';

COMMENT ON COLUMN "driver".id_driver IS 'Identificador único do motorista';
COMMENT ON COLUMN "driver".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "driver".name IS 'Nome completo do motorista';
COMMENT ON COLUMN "driver".cpf IS 'Cadastro de Pessoa Física (CPF) do motorista';
COMMENT ON COLUMN "driver".rg IS 'Registro Geral (RG) do motorista';
COMMENT ON COLUMN "driver".birth_date IS 'Data de nascimento do motorista';
COMMENT ON COLUMN "driver".email IS 'E-mail do motorista';
COMMENT ON COLUMN "driver".license_number IS 'Número da Carteira Nacional de Habilitação (CNH)';
COMMENT ON COLUMN "driver".license_category IS 'Categoria da Carteira Nacional de Habilitação (CNH)';
COMMENT ON COLUMN "driver".license_expiration IS 'Data de vencimento da CNH';
COMMENT ON COLUMN "driver".driver_salary IS 'Salário do motorista';
COMMENT ON COLUMN "driver".driver_type IS 'Tipo de vínculo do motorista';
COMMENT ON COLUMN "driver".salary_date_payment IS 'Data de pagamento do salário';
COMMENT ON COLUMN "driver".status IS 'Status atual do motorista';
COMMENT ON COLUMN "driver".active IS 'Indica se o motorista está ativo';
COMMENT ON COLUMN "driver".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "driver".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "driver".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: driver_phone
-- =========================
COMMENT ON TABLE "driver_phone" IS 'Relacionamento entre motorista e telefone';

COMMENT ON COLUMN "driver_phone".id_driver_phone IS 'Identificador único do relacionamento';
COMMENT ON COLUMN "driver_phone".id_driver IS 'Identificador do motorista';
COMMENT ON COLUMN "driver_phone".id_phone IS 'Identificador do telefone';
COMMENT ON COLUMN "driver_phone".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "driver_phone".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "driver_phone".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: driver_address
-- =========================
COMMENT ON TABLE "driver_address" IS 'Relacionamento entre motorista e endereço';

COMMENT ON COLUMN "driver_address".id_driver_address IS 'Identificador único do relacionamento';
COMMENT ON COLUMN "driver_address".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "driver_address".id_driver IS 'Identificador do motorista';
COMMENT ON COLUMN "driver_address".id_address IS 'Identificador do endereço';
COMMENT ON COLUMN "driver_address".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "driver_address".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "driver_address".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- ENUM: driver_payment_payment_type_enum
-- =========================
COMMENT ON TYPE "driver_payment_payment_type_enum" IS 'Tipo de pagamento ao motorista';

-- =========================
-- TABELA: driver_payment
-- =========================
COMMENT ON TABLE "driver_payment" IS 'Pagamento do motorista';

COMMENT ON COLUMN "driver_payment".id_driver_payment IS 'Identificador único do pagamento';
COMMENT ON COLUMN "driver_payment".id_travel IS 'Identificador da viagem relacionada ao pagamento';
COMMENT ON COLUMN "driver_payment".id_driver IS 'Identificador do motorista';
COMMENT ON COLUMN "driver_payment".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "driver_payment".value IS 'Valor do pagamento';
COMMENT ON COLUMN "driver_payment".date IS 'Data do pagamento';
COMMENT ON COLUMN "driver_payment".payment_type IS 'Tipo de pagamento realizado';
COMMENT ON COLUMN "driver_payment".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "driver_payment".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "driver_payment".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- ENUM: vehicle_status_enum
-- =========================
COMMENT ON TYPE "vehicle_status_enum" IS 'Status do veículo';

-- =========================
-- TABELA: vehicle
-- =========================
COMMENT ON TABLE "vehicle" IS 'Veículo';

COMMENT ON COLUMN "vehicle".id_vehicle IS 'Identificador único do veículo';
COMMENT ON COLUMN "vehicle".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "vehicle".id_color IS 'Identificador da cor do veículo';
COMMENT ON COLUMN "vehicle".id_fueltype IS 'Identificador do tipo de combustível';
COMMENT ON COLUMN "vehicle".model IS 'Modelo do veículo';
COMMENT ON COLUMN "vehicle".year_manufacture IS 'Ano de fabricação do veículo';
COMMENT ON COLUMN "vehicle".license_plate IS 'Placa do veículo';
COMMENT ON COLUMN "vehicle".truck_body_volume IS 'Volume da carroceria';
COMMENT ON COLUMN "vehicle".average_fuel_consumption IS 'Consumo médio de combustível';
COMMENT ON COLUMN "vehicle".passengers IS 'Quantidade de passageiros';
COMMENT ON COLUMN "vehicle".renavam IS 'Registro Nacional de Veículos Automotores (RENAVAM)';
COMMENT ON COLUMN "vehicle".chassis IS 'Número do chassi';
COMMENT ON COLUMN "vehicle".gross_weight_tons IS 'Peso bruto total em toneladas';
COMMENT ON COLUMN "vehicle".number_of_axles IS 'Quantidade de eixos';
COMMENT ON COLUMN "vehicle".fuel_tank_capacity IS 'Capacidade do tanque de combustível';
COMMENT ON COLUMN "vehicle".capacity_kg IS 'Capacidade de carga em quilogramas';
COMMENT ON COLUMN "vehicle".status IS 'Status atual do veículo';
COMMENT ON COLUMN "vehicle".license_expiration IS 'Data de vencimento do licenciamento';
COMMENT ON COLUMN "vehicle".insurance_expiration IS 'Data de vencimento do seguro';
COMMENT ON COLUMN "vehicle".inspection_expiration IS 'Data de vencimento da inspeção';
COMMENT ON COLUMN "vehicle".antt_registration IS 'Registro na Agência Nacional de Transportes Terrestres (ANTT)';
COMMENT ON COLUMN "vehicle".sold_value IS 'Valor de venda do veículo';
COMMENT ON COLUMN "vehicle".current_odometer IS 'Quilometragem atual do veículo';
COMMENT ON COLUMN "vehicle".trip_limit IS 'Limite de quilometragem para alerta de manutenção ou controle interno';
COMMENT ON COLUMN "vehicle".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "vehicle".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "vehicle".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- ENUM: vehicle_maintenance_status_enum
-- =========================
COMMENT ON TYPE "vehicle_maintenance_status_enum" IS 'Status da manutenção do veículo';

-- =========================
-- TABELA: vehicle_maintenance
-- =========================
COMMENT ON TABLE "vehicle_maintenance" IS 'Manutenção do veículo';

COMMENT ON COLUMN "vehicle_maintenance".id_vehicle_maintenance IS 'Identificador único da manutenção';
COMMENT ON COLUMN "vehicle_maintenance".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "vehicle_maintenance".id_vehicle IS 'Identificador do veículo';
COMMENT ON COLUMN "vehicle_maintenance".maintenance_type IS 'Tipo de manutenção realizada';
COMMENT ON COLUMN "vehicle_maintenance".description IS 'Descrição detalhada da manutenção';
COMMENT ON COLUMN "vehicle_maintenance".cost IS 'Custo da manutenção';
COMMENT ON COLUMN "vehicle_maintenance".date IS 'Data da manutenção';
COMMENT ON COLUMN "vehicle_maintenance".mileage IS 'Quilometragem do veículo no momento da manutenção';
COMMENT ON COLUMN "vehicle_maintenance".next_maintenance_date IS 'Data prevista para a próxima manutenção';
COMMENT ON COLUMN "vehicle_maintenance".next_maintenance_mileage IS 'Quilometragem prevista para a próxima manutenção';
COMMENT ON COLUMN "vehicle_maintenance".supplier IS 'Fornecedor ou oficina responsável pelo serviço';
COMMENT ON COLUMN "vehicle_maintenance".status IS 'Status da manutenção';
COMMENT ON COLUMN "vehicle_maintenance".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "vehicle_maintenance".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "vehicle_maintenance".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: vehicle_refueling
-- =========================
COMMENT ON TABLE "vehicle_refueling" IS 'Abastecimento do veículo';

COMMENT ON COLUMN "vehicle_refueling".id_vehicle_refueling IS 'Identificador único do abastecimento';
COMMENT ON COLUMN "vehicle_refueling".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "vehicle_refueling".id_vehicle IS 'Identificador do veículo';
COMMENT ON COLUMN "vehicle_refueling".id_fuel_type IS 'Identificador do tipo de combustível';
COMMENT ON COLUMN "vehicle_refueling".id_travel IS 'Identificador da viagem relacionada ao abastecimento';
COMMENT ON COLUMN "vehicle_refueling".id_driver IS 'Identificador do motorista responsável';
COMMENT ON COLUMN "vehicle_refueling".station IS 'Nome do posto de combustível';
COMMENT ON COLUMN "vehicle_refueling".refueling_date IS 'Data do abastecimento';
COMMENT ON COLUMN "vehicle_refueling".liters IS 'Quantidade de litros abastecidos';
COMMENT ON COLUMN "vehicle_refueling".price_per_liter IS 'Preço por litro do combustível';
COMMENT ON COLUMN "vehicle_refueling".total_cost IS 'Custo total do abastecimento';
COMMENT ON COLUMN "vehicle_refueling".odometer IS 'Quilometragem do veículo no momento do abastecimento';
COMMENT ON COLUMN "vehicle_refueling".full_tank IS 'Indica se o abastecimento completou o tanque';
COMMENT ON COLUMN "vehicle_refueling".notes IS 'Observações adicionais sobre o abastecimento';
COMMENT ON COLUMN "vehicle_refueling".active IS 'Indica se o registro está ativo';
COMMENT ON COLUMN "vehicle_refueling".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "vehicle_refueling".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "vehicle_refueling".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: travel_customer
-- =========================
COMMENT ON TABLE "travel_customer" IS 'Cliente da viagem';

COMMENT ON COLUMN "travel_customer".id_travel_customer IS 'Identificador único do cliente da viagem';
COMMENT ON COLUMN "travel_customer".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "travel_customer".name IS 'Nome do cliente';
COMMENT ON COLUMN "travel_customer".document IS 'Documento do cliente (CPF ou CNPJ)';
COMMENT ON COLUMN "travel_customer".email IS 'E-mail do cliente';
COMMENT ON COLUMN "travel_customer".active IS 'Indica se o cliente está ativo';
COMMENT ON COLUMN "travel_customer".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "travel_customer".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "travel_customer".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: travel
-- =========================
COMMENT ON TABLE "travel" IS 'Viagem';

COMMENT ON COLUMN "travel".id_travel IS 'Identificador único da viagem';
COMMENT ON COLUMN "travel".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "travel".id_vehicle IS 'Identificador do veículo utilizado na viagem';
COMMENT ON COLUMN "travel".id_travel_customer IS 'Identificador do cliente da viagem';
COMMENT ON COLUMN "travel".travel_start_date IS 'Data e hora de início da viagem';
COMMENT ON COLUMN "travel".travel_end_date IS 'Data e hora de término da viagem';
COMMENT ON COLUMN "travel".return_empty_to_departure IS 'Indica se o retorno ao ponto de partida foi realizado vazio';
COMMENT ON COLUMN "travel".total_mileage IS 'Quilometragem total percorrida na viagem';
COMMENT ON COLUMN "travel".start_odometer IS 'Quilometragem inicial do veículo';
COMMENT ON COLUMN "travel".end_odometer IS 'Quilometragem final do veículo';
COMMENT ON COLUMN "travel".truckload_description IS 'Descrição da carga transportada';
COMMENT ON COLUMN "travel".truckload_weight_kg IS 'Peso da carga em quilogramas';
COMMENT ON COLUMN "travel".contract_value IS 'Valor do contrato da viagem';
COMMENT ON COLUMN "travel".total_toll_cost IS 'Custo total com pedágios';
COMMENT ON COLUMN "travel".other_expenses IS 'Outras despesas relacionadas à viagem';
COMMENT ON COLUMN "travel".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "travel".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "travel".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: travel_driver
-- =========================
COMMENT ON TABLE "travel_driver" IS 'Relacionamento entre viagem e motorista';

COMMENT ON COLUMN "travel_driver".id_travel_driver IS 'Identificador único do relacionamento';
COMMENT ON COLUMN "travel_driver".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "travel_driver".id_travel IS 'Identificador da viagem';
COMMENT ON COLUMN "travel_driver".id_driver IS 'Identificador do motorista';
COMMENT ON COLUMN "travel_driver".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "travel_driver".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "travel_driver".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: travel_truck_unloading
-- =========================
COMMENT ON TABLE "travel_truck_unloading" IS 'Ponto de descarga da viagem';

COMMENT ON COLUMN "travel_truck_unloading".id_travel_truck_unloading IS 'Identificador único do ponto de descarga';
COMMENT ON COLUMN "travel_truck_unloading".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "travel_truck_unloading".id_address IS 'Identificador do endereço de descarga';
COMMENT ON COLUMN "travel_truck_unloading".id_travel IS 'Identificador da viagem';
COMMENT ON COLUMN "travel_truck_unloading".unloading_order IS 'Ordem de descarga na rota';
COMMENT ON COLUMN "travel_truck_unloading".expense IS 'Despesa relacionada à descarga';
COMMENT ON COLUMN "travel_truck_unloading".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "travel_truck_unloading".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "travel_truck_unloading".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: address
-- =========================
COMMENT ON TABLE "address" IS 'Endereço';

COMMENT ON COLUMN "address".id_address IS 'Identificador único do endereço';
COMMENT ON COLUMN "address".id_city IS 'Identificador da cidade';
COMMENT ON COLUMN "address".address IS 'Logradouro (rua, avenida, etc.)';
COMMENT ON COLUMN "address".number IS 'Número do imóvel';
COMMENT ON COLUMN "address".complement IS 'Complemento do endereço';
COMMENT ON COLUMN "address".is_main IS 'Indica se é o endereço principal';
COMMENT ON COLUMN "address".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "address".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "address".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: user_address
-- =========================
COMMENT ON TABLE "user_address" IS 'Relacionamento entre usuário e endereço';

COMMENT ON COLUMN "user_address".id_user_address IS 'Identificador único do relacionamento';
COMMENT ON COLUMN "user_address".id_user IS 'Identificador do usuário';
COMMENT ON COLUMN "user_address".id_address IS 'Identificador do endereço';
COMMENT ON COLUMN "user_address".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "user_address".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "user_address".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- ENUM: travel_billing_status_enum
-- =========================
COMMENT ON TYPE "travel_billing_status_enum" IS 'Status do faturamento da viagem';

-- =========================
-- TABELA: travel_billing
-- =========================
COMMENT ON TABLE "travel_billing" IS 'Faturamento da viagem';

COMMENT ON COLUMN "travel_billing".id_travel_billing IS 'Identificador único do faturamento';
COMMENT ON COLUMN "travel_billing".id_user IS 'Identificador do usuário proprietário do registro';
COMMENT ON COLUMN "travel_billing".id_travel IS 'Identificador da viagem relacionada ao faturamento';
COMMENT ON COLUMN "travel_billing".issue_date IS 'Data de emissão da cobrança';
COMMENT ON COLUMN "travel_billing".due_date IS 'Data de vencimento da cobrança';
COMMENT ON COLUMN "travel_billing".value IS 'Valor da cobrança';
COMMENT ON COLUMN "travel_billing".status IS 'Status atual do faturamento';
COMMENT ON COLUMN "travel_billing".payment_date IS 'Data de pagamento da cobrança';
COMMENT ON COLUMN "travel_billing".received_value IS 'Valor efetivamente recebido';
COMMENT ON COLUMN "travel_billing".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "travel_billing".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "travel_billing".deleted_at IS 'Data e hora da exclusão lógica do registro';

-- =========================
-- TABELA: user_phone
-- =========================
COMMENT ON TABLE "user_phone" IS 'Relacionamento entre usuário e telefone';

COMMENT ON COLUMN "user_phone".id_user_phone IS 'Identificador único do relacionamento';
COMMENT ON COLUMN "user_phone".id_user IS 'Identificador do usuário';
COMMENT ON COLUMN "user_phone".id_phone IS 'Identificador do telefone';
COMMENT ON COLUMN "user_phone".created_at IS 'Data e hora de criação do registro';
COMMENT ON COLUMN "user_phone".updated_at IS 'Data e hora da última atualização';
COMMENT ON COLUMN "user_phone".deleted_at IS 'Data e hora da exclusão lógica do registro';