From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] CPU overheats at high frequencies,
	ondemand governor fails to throttle sufficiently.
Date: Sun, 11 May 2008 10:33:38 -0700 (PDT)
Message-ID: <20080511173338.52F2F108061@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10658


davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cpufreq@www.linux.org.uk
         AssignedTo|cpufreq@www.linux.org.uk    |acpi_power-processor@kernel-
                   |                            |bugs.osdl.org
          Component|cpufreq                     |Power-Processor
            Product|Power Management            |ACPI




------- Comment #6 from davej@codemonkey.org.uk  2008-05-11 10:33 -------
I'm reassigning this to ACPI.  Cpufreq doesn't really have enough information
at the layer it lives at to make the sort of decisions necessary.  ACPI does
have code to limit the number of P states that cpufreq will scale to, so I
suspect that code needs tweaking in some manner so that the limiting happens
for a longer period.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
