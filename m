From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Fri, 16 May 2008 11:36:56 -0700 (PDT)
Message-ID: <20080516183656.CB037108061@picon.linux-foundation.org>
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


mjg59-kernel@srcf.ucam.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #16135|0                           |1
        is obsolete|                            |




------- Comment #35 from mjg59-kernel@srcf.ucam.org  2008-05-16 11:36 -------
Created an attachment (id=16166)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=16166&action=view)
Add a passive cooling limit to zones which don't have one

This patch does two new things. Firstly, it only enables polling when the
hardware doesn't already have a passive zone. That stops bug #8842 from hitting
us. Secondly, if a thermal zone contains a _TZD package, that is used rather
than flagging it as applying to all CPUs. This won't currently do anything for
devices other than CPUs as there's no kernel support, but it could be tied in
through the generic thermal layer once we start seeing devices that can handle
it.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
