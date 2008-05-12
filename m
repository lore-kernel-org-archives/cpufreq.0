From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] CPU overheats at high frequencies,
	ACPI fails to throttle sufficiently.
Date: Sun, 11 May 2008 18:36:49 -0700 (PDT)
Message-ID: <20080512013649.12A30108060@picon.linux-foundation.org>
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


rui.zhang@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |venkatesh.pallipadi@intel.co
                   |                            |m




------- Comment #8 from rui.zhang@intel.com  2008-05-11 18:36 -------
Hmm, it's true that ACPI may change the processor P/T-state for thermal
control.
But all of this is done _IF_ the processor is used as the passive cooling
device in this thermal zone, i.e. it's listed in the _PSL method, which is not
true in the acpidump attached.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
