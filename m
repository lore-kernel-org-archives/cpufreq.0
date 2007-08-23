From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8924] module speedstep-centrino does not load
Date: Wed, 22 Aug 2007 17:01:08 -0700 (PDT)
Message-ID: <20070823000108.BCBFE10801C@picon.linux-foundation.org>
References: <bug-8924-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8924-3570@http.bugzilla.kernel.org/>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8924





------- Comment #5 from arjan@infradead.org  2007-08-22 17:08 -------
On Wed, 22 Aug 2007 16:44:51 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:
> > Problem Description: modprobe speedstep-centrino quits with error
> > "no such device"


does the acpi-cpufreq driver work? on such new hardware that really
should be used rather than the legacy-hw speedstep-centrino


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
