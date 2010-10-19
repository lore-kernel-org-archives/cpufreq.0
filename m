From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] CPU0 locked at slower speed, regardless of governor on
 IP35 Pro(Intel P35-ICH9R)
Date: Tue, 19 Oct 2010 00:55:09 GMT
Message-ID: <201010190055.o9J0t91i023114@demeter1.kernel.org>
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


Zhang Rui <rui.zhang@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rui.zhang@intel.com




--- Comment #10 from Zhang Rui <rui.zhang@intel.com>  2010-10-19 00:54:57 ---
As the _TMP returns fixed value, I suggest Jason to either update the BIOS to
see if the situation is improved, or disable the ACPI thermal driver because it
will never work with this BIOS.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
