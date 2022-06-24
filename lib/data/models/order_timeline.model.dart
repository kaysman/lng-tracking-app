import 'package:json_annotation/json_annotation.dart';
import 'package:v2_tracking_page/data/enums/status.enum.dart';

part 'order_timeline.model.g.dart';

@JsonSerializable()
class OrderTimeline {
  final String? orderId;
  final String? description;
  final String? status;
  final TypesOfOrderTimelineLogs? typeOfOrderTimelineLog;
  final WorkflowStepType? typeOfWorkflowStep;
  final WorkflowStepIsTaskRelated? taskRelated;
  final String? createdByUserName;

  OrderTimeline({
    this.orderId,
    this.createdByUserName,
    this.description,
    this.status,
    this.typeOfOrderTimelineLog,
    this.typeOfWorkflowStep,
    this.taskRelated,
  });

  factory OrderTimeline.fromJson(Map<String, dynamic> json) =>
      _$OrderTimelineFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTimelineToJson(this);
}
