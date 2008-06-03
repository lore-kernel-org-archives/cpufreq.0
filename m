From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue,  3 Jun 2008 10:55:58 -0700 (PDT)
Message-ID: <20080603175558.33DFF11D108@picon.linux-foundation.org>
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





------- Comment #47 from mjg59-kernel@srcf.ucam.org  2008-06-03 10:55 -------
Len,

if there were any significant body of hardware where infrequently reading the
temperature caused problems, I suspect we'd have heard about it. However, this
is a straightforward patch with no further dependencies - it's trivial to back
it out if it turns out it does break things.

Our hardware usage profile is always going to diverge from Windows to some
extent. Where that results in undesirable behaviour, the obvious fix is to
modify our behaviour to be more like Windows. That doesn't mean that we should
constrain our functionality by refusing to diverge from Windows' behaviour even
if we have no reason to believe it would break anything! The issue with bug
#8842 was not the polling per se, but the ridiculously low passive cooling
point. Nobody has yet demonstrated a system where polling would genuinely cause
problems, but we have a demonstrated case where this code helps existing users. 

In the long run we'll want functionality like this for non-broken hardware
anyway (datacentre thermal constraints, for instance), and putting it in the
kernel is significantly safer than leaving it sitting in userspace with unknown
latency requirements. It's something that could be done at the generic thermal
class layer instead, but I'd prefer for that to mature further before moving it
there.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
