From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: longhaul: Unknown VIA CPU
Date: Wed, 3 Sep 2003 14:52:04 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903125204.GB4401@poupinou.org>
References: <3F55187F.70707@free.fr> <1062596994.574.1.camel@sven>
	<20030903120038.GF1225@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903120038.GF1225@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 01:00:39PM +0100, Dave Jones wrote:
> On Wed, Sep 03, 2003 at 11:49:55PM +1000, Sven Dowideit wrote:
>  > I sent DaveJones a patch that at least says that the Nehemiah is not
>  > implemented, but i have not heard from him since..
> 
> sorry, I thought I replied..
> 
>  > also, the email
>  > address will need to be changed to the codemonkey one :)
> 
> Already fixed in 2.6, not sure about the 2.4/2.4-ac backports.

ducrot@neptune:~$ cvs rdiff -u -r LINUX_2_4 -rLINUX_2_5 cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c
Index: cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c
diff -u cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c:1.1.1.1 cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c:1.93
--- cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c:1.1.1.1   Mon Aug 25 15:58:46 2003
+++ cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c   Tue Aug 19 14:38:32 2003
@@ -597,6 +597,7 @@
        .target         = longhaul_target,
        .init           = longhaul_cpu_init,
        .name           = "longhaul",
+       .owner          = THIS_MODULE,
 };
 
 static int __init longhaul_init (void)
ducrot@neptune:~$ cvs rdiff -u -r LINUX_2_4 -rLINUX_2_5 cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h



-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
