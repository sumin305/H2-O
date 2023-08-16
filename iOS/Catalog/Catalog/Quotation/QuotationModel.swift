//
//  QuotationModel.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/16.
//

import Foundation

enum QuotationModel {

  struct State {
    var totalPrice: CLNumber
    var quotation: CarQuotation?
  }

  enum ViewAction {
    case isTrimSelected(defaultCarQuotation: CarQuotation)

    case isTrimChanged(trim: Trim)
    case isPowertrainChanged(powertrain: PowerTrainModel)
    case isBodyTypeChanged(bodytype: BodyTypeModel)
    case isDrivetrainChanged(drivetrain: DriveTrainModel)
    // TODO: - 색상 모델 채우기
    case isExternalColorChanged
    case isInternalColorChanged
    case isOptionChanged(option: ExtraOptionModel)

    case isPriceChanged
  }
}
