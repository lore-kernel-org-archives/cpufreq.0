From: Dave Jones <davej@redhat.com>
Subject: Re: Patch: Fix pending timer stuck condition
Date: Fri, 21 Oct 2005 15:19:23 -0400
Message-ID: <20051021191923.GA5827@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A84303218896@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218896@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Oct 21, 2005 at 01:02:48PM -0500, Langsdorf, Mark wrote:
 > AMD recently discovered that on some hardware,
 > there is a race condition possible when a C-state
 > change request goes onto the bus at the same time
 > as a P-state change request.  Both requests happen,
 > but the southbridge hardware only acknowledges the
 > C-state change.  The PowerNow! driver is then 
 > stuck in a loop, waiting for the P-state change
 > acknowledgement.  The driver eventually times out,
 > but can no longer perform P-state changes.
 > 
 > It turns out the solution is to resend the P-state
 > change, which the southbridge will acknowledge
 > normally.
 > 
 > Thanks to Johannes Winkelmann for reporting this
 > and testing the fix.

Excellent detective work!
I'll get this sent along to Linus for inclusion in 2.6.14
as there have been a number of reports of this.

One question though, this part..

-               if (i++ > 0x1000000) {
+               if (i++ > 10000) {
                        printk(KERN_ERR PFX "detected change pending stuck\n");
                        return 1;


means that on affected hardware, we'll see that msg a lot more
regularly now. Was this intentional, or a leftover debugging change ?

Final nit, please add a Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
line for future patches.  (I still apply them if they lack that line,
but following the established protocol is a nice bonus touch ;-)

		Dave
