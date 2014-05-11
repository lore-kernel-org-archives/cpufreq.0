From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72361] AMD APU reset infinite
Date: Sun, 11 May 2014 15:02:19 +0000
Message-ID: <bug-72361-12968-yqOq7TmZQa@https.bugzilla.kernel.org/>
References: <bug-72361-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72361-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72361

Mika Hyttinen <mika.hyttinen@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.hyttinen@gmail.com

--- Comment #1 from Mika Hyttinen <mika.hyttinen@gmail.com> ---
I have this same issue on MSI FM2-A75IA-E53. This issue seems to be only on MSI
motherboards (see https://github.com/OpenELEC/OpenELEC.tv/issues/3093).

Disabling acpi_cpufreq is working, but one OpenELEC user found other solution
which also works by adding radeon.dpm=0 to boot parameters.

-- 
You are receiving this mail because:
You are the assignee for the bug.
