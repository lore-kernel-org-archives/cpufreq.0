From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Wed, 14 May 2008 00:36:34 -0700 (PDT)
Message-ID: <20080514073634.332BC108062@picon.linux-foundation.org>
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


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REJECTED                    |CLOSED




------- Comment #28 from len.brown@intel.com  2008-05-14 00:36 -------
re: comment #25

The wording in ACPI 3.0 is incorrect, and will be fixed in ACPI 4.0:
http://www.acpica.org/bugzilla/show_bug.cgi?id=714

This has come up before, and until the ACPI bug report above,
the "documentation" has been this commit log:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=730ff34de766a6fddee25ac1c32bc49c1a2fd758

If we implemented the patch in comment #25, we would be
swimming against the stream of "common industry practice".
The proof is systems like that in bug #8842, which would break.

Thus, the patch in comment #25 must not be applied.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
