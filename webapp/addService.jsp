<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Service — SwiftDrive</title>
    <!-- Tailwind via CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- subtle font enhancement (optional, only for better appearance) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz@14..32&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', system-ui, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 to-blue-50 flex items-center justify-center min-h-screen p-4">

    <!-- main card – clean, elevated, softly bordered -->
    <div class="w-full max-w-md">
        <div class="bg-white/80 backdrop-blur-sm rounded-2xl shadow-xl border border-white/30 overflow-hidden transition-all hover:shadow-2xl duration-300">

            <!-- header with accent stripe and icon-like symbol -->
            <div class="bg-gradient-to-r from-blue-600 to-indigo-600 px-6 py-5">
                <div class="flex items-center gap-2 text-white">
                    <!-- simple abstract "plus" badge -->
                    <span class="bg-white/20 p-2 rounded-xl backdrop-blur-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd" />
                        </svg>
                    </span>
                    <h2 class="text-xl font-semibold tracking-tight">New service record</h2>
                </div>
            </div>

            <!-- form body – generous spacing, smooth inputs -->
            <div class="p-6 sm:p-8">
                <form action="AddServiceServlet" method="POST" class="space-y-5">

                    <!-- date field with icon -->
                    <div class="space-y-1.5">
                        <label class="text-sm font-medium text-gray-700 flex items-center gap-1.5">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-indigo-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                            Service date
                        </label>
                        <input type="date" name="date" required
                               class="w-full px-4 py-3 border border-gray-200 rounded-xl text-gray-700 bg-gray-50/50 focus:bg-white focus:ring-2 focus:ring-indigo-300 focus:border-indigo-400 transition-all duration-200 placeholder-gray-400">
                    </div>

                    <!-- service type with icon -->
                    <div class="space-y-1.5">
                        <label class="text-sm font-medium text-gray-700 flex items-center gap-1.5">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-indigo-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                            </svg>
                            Service type
                        </label>
                        <input type="text" name="serviceType" placeholder="e.g., Oil change, brake pads" required
                               class="w-full px-4 py-3 border border-gray-200 rounded-xl text-gray-700 bg-gray-50/50 focus:bg-white focus:ring-2 focus:ring-indigo-300 focus:border-indigo-400 transition-all duration-200 placeholder-gray-400">
                    </div>

                    <!-- cost field with currency symbol and improved step -->
                    <div class="space-y-1.5">
                        <label class="text-sm font-medium text-gray-700 flex items-center gap-1.5">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-indigo-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            Cost (USD)
                        </label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-500 font-medium">$</span>
                            <input type="number" step="0.01" name="cost" placeholder="0.00" required
                                   class="w-full pl-8 pr-4 py-3 border border-gray-200 rounded-xl text-gray-700 bg-gray-50/50 focus:bg-white focus:ring-2 focus:ring-indigo-300 focus:border-indigo-400 transition-all duration-200 placeholder-gray-400">
                        </div>
                    </div>

                    <!-- action buttons – spacious, attractive gradient for save -->
                    <div class="grid grid-cols-2 gap-3 pt-4">
                        <button type="submit"
                                class="bg-gradient-to-r from-emerald-500 to-green-600 hover:from-emerald-600 hover:to-green-700 text-white font-semibold py-3 px-4 rounded-xl shadow-md hover:shadow-lg transform transition-all duration-200 focus:ring-2 focus:ring-green-400 focus:outline-none">
                            <span class="flex items-center justify-center gap-2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                                </svg>
                                Save record
                            </span>
                        </button>
                        <a href="dashboard.jsp"
                           class="bg-white border border-gray-300 hover:bg-gray-100 text-gray-700 font-semibold py-3 px-4 rounded-xl shadow-sm hover:shadow-md transition-all duration-200 flex items-center justify-center gap-2 group">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- optional background decoration (just for delight) -->
    <div class="hidden sm:block fixed -z-10 top-20 left-10 w-72 h-72 bg-indigo-200 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse"></div>
    <div class="hidden sm:block fixed -z-10 bottom-20 right-10 w-80 h-80 bg-emerald-200 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse delay-1000"></div>
</body>
</html>