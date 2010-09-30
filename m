From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] CPU0 locked at slower speed, regardless of governor
Date: Thu, 30 Sep 2010 09:46:41 GMT
Message-ID: <201009300946.o8U9kf5Q024226@demeter1.kernel.org>
References: <bug-19262-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19262-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19262





--- Comment #4 from Jason Lynch <aexoden@gmail.com>  2010-09-30 09:46:37 ---
Here is the requested information:

/proc/acpi/thermal_zone/THRM/cooling_mode
0 - Active; 1 - Passive

/proc/acpi/thermal_zone/THRM/polling_frequency
<polling disabled>

/proc/acpi/thermal_zone/THRM/state
state:                   ok

/proc/acpi/thermal_zone/THRM/temperature
temperature:             20 C

/proc/acpi/thermal_zone/THRM/trip_points
critical (S5):           255 C
passive:                 0 C: tc1=4 tc2=3 tsp=60 devices=CPU0

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
