From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10383] CPU FREQ policy value scaling_max_freq gets stuck at
	800MHz on core2duo
Date: Wed,  2 Apr 2008 12:15:46 -0700 (PDT)
Message-ID: <20080402191546.C43D910805D@picon.linux-foundation.org>
References: <bug-10383-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10383-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10383


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED




------- Comment #15 from trenn@suse.de  2008-04-02 12:15 -------
The message:
ACPI Error (tbinstal-0134): Table has invalid signature [    ], must be SSDT,
PSDT or OEMx [20070126]

Comes from the visit table (see the other bug)which is missing the "SSDT" in
the table header.
This is clearly a BIOS bug.
The table is not loaded when osi=!Winows 2006 is passed.

These machines are so similar, I mark the bugs as duplicates now.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
