From: Dave Jones <davej@redhat.com>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Thu, 03 Jun 2004 21:34:05 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086294845.2970.1.camel@delerium.codemonkey.org.uk>
References: <40BF3686.6030701@pacific.edu>
	<20040603172511.GG13782@poupinou.org> <40BF67C3.90607@pacific.edu>
	<20040603182047.GH13782@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040603182047.GH13782@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq <Cpufreq@www.linux.org.uk>

On Thu, 2004-06-03 at 19:20, Bruno Ducrot wrote:

> 
>         Package (0x06)
>         {
>             0x00000320, 
>             0x000032C8, 
>             0x00000064, 
>             0x00000006, 
>             0xE0202E00, 
>             0x00000600
>         }, 
> 
>         Package (0x06)
>         {
>             0x00000320, 
>             0x000032C8, 
>             0x00000064, 
>             0x00000006, 
>             0xE0202E00, 
>             0x00000600
>         }
>     })
> 
> 
> The last two states are *exactly* the same.  Then powernow-k8 complains that
> there is 2 low states (which is not supported, as Paul will tell us).
> Then the driver fail.

We could kludge around this by doing a compare of the tables before we
abort, and if they are the same, just ignore one of them.
If it differs, we do what we do now.

Ideally, this should be fixed in a BIOS update though, or alternatively
an ACPI fallback.

Paul ?

	Dave
