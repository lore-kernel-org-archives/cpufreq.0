From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue,  3 Jun 2008 12:00:28 -0700 (PDT)
Message-ID: <20080603190028.2725210805E@picon.linux-foundation.org>
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





------- Comment #49 from mjg59-kernel@srcf.ucam.org  2008-06-03 12:00 -------
Your description of node manager is effectively identical to using a fake _PSV
- it's just got a wider range of temperature information available to it. In
either case you're polling the temperature sensors and limiting P states if the
temperature rises above a certain point and is trending upwards. Implementing
this in-kernel in a generic way would facilitate both, and avoid the issues
with hadling it in userspace (such as OOM situations allowing your machine to
leave its thermal envelope - the current implemetation of the generic thermal
class even disables in-kernel handling of critical shutdown temperatures!)

But this is not purely an issue with a single machine. Distribution bugzillas
have multiple entries from users facing this issue, on a range of hardware
platforms. If the sole objection to this is "Windows doesn't behave like this,
and hypothetical hardware might not like it" then I'd rather we went with it
until an example of such hardware is shown to exist.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
