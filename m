From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Thu, 12 Sep 2013 14:49:13 +0000
Message-ID: <bug-60839-12968-4Rhmr5uNzw@https.bugzilla.kernel.org/>
References: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60839-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60839

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |NEEDINFO

--- Comment #8 from Lan Tianyu <tianyu.lan@intel.com> ---
Please also provide dmesg after testing with cpufreq debug opening.
Run "echo "file cpufreq.c +p" > /sys/kernel/debug/dynamic_debug/control to open
debug.

-- 
You are receiving this mail because:
You are the assignee for the bug.
