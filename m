From: Dave Jones <davej@redhat.com>
Subject: Re: writing a cpufreq driver
Date: Fri, 22 Sep 2006 11:49:41 -0400
Message-ID: <20060922154941.GB15032@redhat.com>
References: <20060921193141.GE17065@redhat.com>
	<1449F58C868D8D4E9C72945771150BDF153669@SAUSEXMB1.amd.com>
	<20060921194714.GH17065@redhat.com>
	<20060922154448.GO4945@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060922154448.GO4945@poupinou.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Cpufreq@lists.linux.org.uk, nemesis@icequake.net

On Fri, Sep 22, 2006 at 05:44:48PM +0200, Bruno Ducrot wrote:
 
 > > Looking at it again..
 > > cpufreq_notify_transition() is calling adjust_jiffies()
 > > which should be doing the same thing, so we should be good to go.
 > > 
 > > It looks like feasible that recalibrate_cpu_khz() could actually
 > > be killed off.
 > 
 > It's called only at init time because cpu_khz is not
 > reliable on some platform due to braindamaged BIOS
 > that switch frequency of the K7 onto the SMM handler
 > when ACPI enable performance control, breaking AMD
 > recommandation at the same time BTW.

Ahh. That deserves a comment. Another alternative would
be to do a transition on startup, which would end up adjusting
it through the notifiers.

	Dave
