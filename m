From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10562] Powersave feature not available on VIA C7-D CPU's
Date: Wed, 30 Apr 2008 03:21:54 -0700 (PDT)
Message-ID: <20080430102154.A7F7410805D@picon.linux-foundation.org>
References: <bug-10562-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10562-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10562


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de
         AssignedTo|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED




------- Comment #6 from trenn@suse.de  2008-04-30 03:21 -------
Works for me with a 1,2 GHz Esther CPU (I will post cpuinfo when I am at home).
I didn't check the very details as everything just worked out of the box with
latest openSUSE 11.0.
I have a Jetway mainboard and they have some "default" ACPI implementation put
into their BIOS. Even fan and temperature are exposed via ACPI. Also the
cpufreq states are exposed via ACPI because it's acpi-cpufreq providing
cpufreq.
Therefore I am pretty sure you have an ACPI BIOS problem.
Can you attach dmesg and acpidump output, pls.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
