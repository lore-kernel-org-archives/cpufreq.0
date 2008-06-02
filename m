From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10062] cpufreq scaling for via c3 no longer works
Date: Sun,  1 Jun 2008 18:53:29 -0700 (PDT)
Message-ID: <20080602015329.8CBBA108035@picon.linux-foundation.org>
References: <bug-10062-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10062-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10062


protasnb@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |protasnb@gmail.com,
                   |                            |rafalbilski@interia.pl




------- Comment #3 from protasnb@gmail.com  2008-06-01 18:53 -------
There was a commit that tried to deal with longhaul erratas:
commit 52a2638bff063acb28ba3355891c49cc240cc98b
Author: Rafal Bilski <rafalbilski@interia.pl>
Date:   Sun Oct 7 00:24:32 2007 -0700

    Longhaul: add auto enabled "revid_errata" option

    VIA C3 Ezra-T has RevisionID equal to 1, but it needs RevisionKey to be 0
    or CPU will ignore new frequency and will continue to work at old
    frequency.  New "revid_errata" option will force RevisionKey to be set to
    0, whatever RevisionID is.

    Additionaly "Longhaul" will not silently ignore unsuccessful transition.
    It will try to check if "revid_errata" or "disable_acpi_c3" options need to
    be enabled for this processor/system.

    Same for Longhaul ver.  2 support.  It will be disabled if none of above
    options will work.

     Best case scenario (with patch apllied and v2 enabled):
     longhaul: VIA C3 'Ezra' [C5C] CPU detected.  Longhaul v2 supported.
     longhaul: Using northbridge support.
     longhaul: VRM 8.5
     longhaul: Max VID=1.350  Min VID=1.050, 13 possible voltage scales
     longhaul: f: 300000 kHz, index: 0, vid: 1050 mV
     [...]
     longhaul: Voltage scaling enabled.
     Worst case scenario:
     longhaul: VIA C3 'Ezra-T' [C5M] CPU detected.  Powersaver supported.
     longhaul: Using northbridge support.
     longhaul: Using ACPI support.
     longhaul: VRM 8.5
     longhaul: Claims to support voltage scaling but min & max are both 1.250.
Voltage scaling disabled
     longhaul: Failed to set requested frequency!
     longhaul: Enabling "Ignore Revision ID" option.
     longhaul: Failed to set requested frequency!
     longhaul: Disabling ACPI C3 support.
     longhaul: Disabling "Ignore Revision ID" option.
     longhaul: Failed to set requested frequency!
     longhaul: Enabling "Ignore Revision ID" option.

You can enable CPU_FREQ_DEBUG and place cpufreq.debug=2 for driver debug on the
boot command line.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
