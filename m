From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Another mobile stepping - speedstep works fine
Date: Fri, 20 Aug 2004 12:21:25 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1093029685.25283.12.camel@localhost>
References: <20040820093344.GA2923@akamail.com>
	<1093008540.30854.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-ABRXYyx97hYzjTJrxAku"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1093008540.30854.37.camel@localhost.localdomain>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq list <cpufreq@www.linux.org.uk>


--=-ABRXYyx97hYzjTJrxAku
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-08-20 at 14:29 +0100, Alan Cox wrote:
> I just added the stepping and ran some testing. Its been running with
> cpuspeed daemon for a day now and seems fine.

Thanks.  The driver looks a bit different now, so I've recast the patch.

David, could you put this in your tree?

Thanks,
	J

--=-ABRXYyx97hYzjTJrxAku
Content-Disposition: attachment; filename=sc-ac-dothan-a2.patch
Content-Type: text/x-patch; name=sc-ac-dothan-a2.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    3 +++
 1 files changed, 3 insertions(+)

diff -puN arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~sc-ac-dothan-a2 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- local-2.6/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~sc-ac-dothan-a2	2004-08-20 09:45:21.358254383 -0700
+++ local-2.6-jeremy/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-20 09:45:57.315356194 -0700
@@ -53,12 +53,14 @@ struct cpu_id
 enum {
 	CPU_BANIAS,
 	CPU_DOTHAN_A1,
+	CPU_DOTHAN_A2,
 	CPU_DOTHAN_B0,
 };
 
 static const struct cpu_id cpu_ids[] = {
 	[CPU_BANIAS]	= { 6,  9, 5 },
 	[CPU_DOTHAN_A1]	= { 6, 13, 1 },
+	[CPU_DOTHAN_A2]	= { 6, 13, 2 },
 	[CPU_DOTHAN_B0]	= { 6, 13, 6 },
 };
 #define N_IDS	(sizeof(cpu_ids)/sizeof(cpu_ids[0]))
@@ -221,6 +223,7 @@ static struct cpu_model models[] =
 
 	/* NULL model_name is a wildcard */
 	{ &cpu_ids[CPU_DOTHAN_A1], NULL, 0, NULL },
+	{ &cpu_ids[CPU_DOTHAN_A2], NULL, 0, NULL },
 	{ &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
 
 	{ NULL, }

_

--=-ABRXYyx97hYzjTJrxAku
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-ABRXYyx97hYzjTJrxAku--


