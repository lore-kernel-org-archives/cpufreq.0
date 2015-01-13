From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] acpi-cpufreq cannot be loaded.
Date: Tue, 13 Jan 2015 00:06:51 +0000
Message-ID: <bug-91141-12968-mjtn0cwGm1@https.bugzilla.kernel.org/>
References: <bug-91141-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-91141-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91141

--- Comment #3 from Brett Johnson <spam@brettcave.net> ---
Created attachment 163341
  --> https://bugzilla.kernel.org/attachment.cgi?id=163341&action=edit
dmesg after enable debug commands then "modprobe acpi-cpufreq"

I recompiled a fresh 3.14.28 kernel with CONFIG_DYNAMIC_DEBUG=y. I noticed I
didn't have much enabled for debugging. Let me know if more debug CONFIG's need
to be compiled in or please link me if there is a web page already showing
preferred kernel debug settings for this.

-- 
You are receiving this mail because:
You are the assignee for the bug.
