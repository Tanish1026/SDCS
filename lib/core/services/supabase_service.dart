class SupabaseService {
  const SupabaseService();

  Future<List<Map<String, dynamic>>> fetchWorkers() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return const [
      {'name': 'Rahul Sharma', 'role': 'Site Supervisor', 'status': 'Available'},
      {'name': 'Aisha Khan', 'role': 'Logistics Lead', 'status': 'On Leave'},
      {'name': 'Imran Ali', 'role': 'Machine Operator', 'status': 'Allocated'},
    ];
  }

  Future<void> saveAllocation(Map<String, dynamic> payload) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    // Placeholder for Supabase insert/update call.
    // Example: await supabase.from('allocations').insert(payload);
  }
}
