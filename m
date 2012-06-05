From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 43284] CPU stuck at minimum frequency - HP Compaq 6715b
Date: Tue,  5 Jun 2012 02:24:58 +0000 (UTC)
Message-ID: <20120605022458.DA7B011FC43@bugzilla.kernel.org>
References: <bug-43284-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-43284-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43284


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |acpi-bugzilla@lists.sourcef
                   |                            |orge.net
          Component|Config-Processors           |cpufreq
         AssignedTo|acpi_config-processors@kern |cpufreq@vger.kernel.org
                   |el-bugs.osdl.org            |
            Product|ACPI                        |Power Management
            Summary|PROBLEM: Performance drop   |CPU stuck at minimum
                   |                            |frequency - HP Compaq 6715b




--- Comment #1 from Len Brown <lenb@kernel.org>  2012-06-05 02:24:58 ---
> Mobile AMD Sempron(tm) Processor 3800+

Please run the following command on the failing
kernel and capture the output:

grep .  /sys/devices/system/cpu/cpu*/cpufreq/*

Then please run the same kernel on the latest
working kernel and capture the output.

This will tell us if something changed, like the
cpufreq driver binding to this system etc.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
