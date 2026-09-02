import 'package:flutter/material.dart';

class HeroSlide {
  final String imageUrl;
  final String tag;
  final String title;
  final String subtitle;
  final String ctaLabel;

  const HeroSlide({
    required this.imageUrl,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
  });
}

class ServiceCategory {
  final String label;
  final IconData icon;

  const ServiceCategory({required this.label, required this.icon});
}

const List<HeroSlide> heroSlides = [
  HeroSlide(
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAhBuIXpNr_BRkyqoQeWeZXknmW6zRnL-2z8QCwqGY7nnha6hryDsOrv5kYxQEoFoSy0WtN6E8jOVQfzXrX3GDKvokX3hf2hwST4J93Ne6lMR5zL8Q6qfMl1zKidm11FAuWHmLSXqsGwuWVvxw_GtKrEjCiSK59kNaRn7CXJEAK6__569KfRB99Sw9x3PDNDFSw0fw1CovTga31ZXuyRs-qnkNp1SHsEYXL4mP-kD6hR2rts6fAZlFp',
    tag: 'Verified Professionals',
    title: 'Expert Plumbing Services',
    subtitle:
        'Reliable, transparent, and cooperative-backed plumbing solutions for your home or business.',
    ctaLabel: 'Book a Plumber',
  ),
  HeroSlide(
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuD6i2XT1oIwMYZgBUl9x8N29B54mLI_AP7GSrfW2hxLTZOxqx9VhCJ09kryGICezKvg_RdiQAjZmJx8mPqRoor5ME_S_66go395Bzj2HNzJygYRMweBKueiEfBnsKp378rtIJM07cwsquwKnB-TUwN5HeLjCgi-6y3UKkiqmZsvvk3F97xOueK8PQGnFpArgYG-FB0odXhhXmg4R9OgOZsoo2KG1EfgAeB6Gqz7ljJwb8hNnn8CLdA5',
    tag: 'Deep Cleaning',
    title: 'Spotless Spaces, Guaranteed',
    subtitle:
        'Our cooperative members deliver meticulous cleaning services with eco-friendly products.',
    ctaLabel: 'Schedule Cleaning',
  ),
  HeroSlide(
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBhaET9wCTDQIFKQwUqTb5qr7ng0b59uG7ZH655XFAY5paQmxVn__CfEpg4Nt91wlR6d4RKWnhDTPTe7aYRj--xZ50ui4SK1aEVUyESEwphYu6bebDFQiyUX8AiWAXTQhAimIjkQH74gRKPPXOp8eqfLGwSnRIwDn1yrLTsKbTTDg0G7jUCeal1MvKJ-_pmZofTTSBkDVpQz_WciTzRG-rvdLPWt1P4FVNf0TIfPbGAPba0u-aTlz2n',
    tag: 'Compassionate Care',
    title: 'Dignified Elderly Support',
    subtitle:
        'Trained, background-checked caregivers providing assistance and companionship with respect.',
    ctaLabel: 'Find a Caregiver',
  ),
  HeroSlide(
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuC1Q1CJYwgFMyF_TL2STd4CIHlgoaP5tJdGWo1q-x50vFbZq2JQ4PtrMldW2lSK0FMTeqjb1bRNeQ3VbypWe0nz9qtEAEWeB2mKxG2x8JKflNT3qa-Zve240PXzMfRjASjhWJMyBhrhfQrt6_0NInWhhzQdpNz5sh3H-5WFgPXz9jQN7gtFXQN23IX1S_chTY9-DYILFRqjIUPK-M2M7xdElfRRcygB3Qe9mQqjx-TnRt39Cnbut4yn',
    tag: 'Green Thumb',
    title: 'Professional Gardening',
    subtitle:
        'From lawn maintenance to landscape design, our skilled cooperative members bring your outdoor spaces to life.',
    ctaLabel: 'Book Gardening',
  ),
  HeroSlide(
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAbEoLS1Sf5ygTHKGEI0UOGMfDcU4I4U9fDQJzQKj6_ul1T74ZFb7dIyFVcqKq9t_6p4MV2IiSAe69UHbN8lcJt9Yy7HGXpxlVqxQhLb7BS4K7Nons74R9gQaB9OC8HIrzmVFuLleG3xBMdKhRWKFkJVCGlB3y1X5inx7oqD9Nbjp36v3ET7chXDlFq1xmcV1R2jowQzBGqsp42G8oV6PStcgQB1Pj589f3wfqIbigFVzFoiIt7mv22',
    tag: 'Safety First',
    title: 'Certified Electrical Work',
    subtitle:
        'Prompt, safe, and regulated electrical services by experienced cooperative electricians.',
    ctaLabel: 'Request Electrician',
  ),
];

const List<ServiceCategory> categories = [
  ServiceCategory(label: 'Plumbing', icon: Icons.water_drop_outlined),
  ServiceCategory(label: 'Cleaning', icon: Icons.cleaning_services_outlined),
  ServiceCategory(label: 'Elderly Care', icon: Icons.elderly_outlined),
  ServiceCategory(label: 'Gardening', icon: Icons.grass_outlined),
  ServiceCategory(label: 'Electrical', icon: Icons.electrical_services_outlined),
  ServiceCategory(label: 'All Services', icon: Icons.more_horiz),
];

const String logoUrl =
    'https://lh3.googleusercontent.com/aida/AEtjO1WcSbsECZZ-GY52Cru8zj5TBfCgeh6egD13O7YlhkTRjeDRO_Bt1hVe6Q988z6dE8NY58nAdrsQKVGt0kw5-qufdDJpM0HRt5i8-_KQ8vyH9WVQw9FGV8Bcp5Gk9wRe-DxcFoE2yLPA4KboQS42SPSuHhCMn3N8ROb4lEKwtuln7qIO7cit_NvFz7ftyN6PRiwOdmrLBOjxxWiYUohsLUjdIf3YTtsnzPpy2eOCWMNaexW14v60J_LLC-M';

const String loginLogoUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDt4jX8GesrhAauxWaeUHvwYZiRFs2dZ2T-8GegCNZ9VNG94krVOc-_MHKl7m9OHVbtdCEjrbQjYdBJuu5okSL4vUkDQK2mkdYseQSk3S9pW-NhBMiJYTgJqkq1gAKeLfbo-kSW-McY5op7OmYy29kAH8sD6-z5GREXsvyY-uV8OgQatfJI4LzLN1FtX0zOtEVfX-otEDP3K7xKl_QL0J71AkjQtm7D4KE6b7tU5DaW1TrogAmQ0qAR';

const String teamPhotoUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCe0hUSEmxTbWwSpwGzWSIe-t3Z9QrdS4ItndaUJBsQMTOeMADh_KR-dhK-Dh0nPHqXOBGQcy7l33XrQCAlw-Cnmr2bfRoujiO2b18QK8_9YJ8egCSZ5g14IpJy1F-st6yj31LlQC8lX80FYuWvgbnFpJNlG_8g7X2Db1bbMKp-tlve65GgRmrF2n8innxy3ySx5xKU22ojb-2oF4-QdYCRcbjE4wj4ALbeblH05MOk1pObjDhx0m_h';
