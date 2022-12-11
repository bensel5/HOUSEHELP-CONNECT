/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'e_provider_model.dart';
import 'parents/model.dart';
import 'payment_model.dart';
import 'subscription_package_model.dart';

class EProviderSubscription extends Model {
  String id;
  EProvider eProvider;
  SubscriptionPackage subscriptionPackage;
  DateTime startsAt;
  DateTime expiresAt;
  Payment payment;
  bool active;

  EProviderSubscription({this.id, this.eProvider, this.subscriptionPackage, this.startsAt, this.expiresAt, this.payment, this.active});

  EProviderSubscription.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    eProvider = objectFromJson(json, 'e_provider', (value) => EProvider.fromJson(value));
    subscriptionPackage = objectFromJson(json, 'subscription_package', (value) => SubscriptionPackage.fromJson(value));
    startsAt = dateFromJson(json, 'starts_at', defaultValue: null);
    expiresAt = dateFromJson(json, 'expires_at', defaultValue: null);
    payment = objectFromJson(json, 'payment', (value) => Payment.fromJson(value));
    active = boolFromJson(json, 'active');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.eProvider != null && this.eProvider.hasData) {
      data['e_provider_id'] = this.eProvider.id;
    }
    if (this.subscriptionPackage != null && this.subscriptionPackage.hasData) {
      data['subscription_package_id'] = this.subscriptionPackage.id;
    }
    if (this.startsAt != null) {
      data['starts_at'] = startsAt.toUtc().toString();
    }
    if (this.expiresAt != null) {
      data['expires_at'] = expiresAt.toUtc().toString();
    }
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    if (this.active != null) {
      data['active'] = active;
    }
    return data;
  }
}
