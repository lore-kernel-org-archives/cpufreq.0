From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Thu, 3 Jun 2004 20:20:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040603182047.GH13782@poupinou.org>
References: <40BF3686.6030701@pacific.edu>
	<20040603172511.GG13782@poupinou.org> <40BF67C3.90607@pacific.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40BF67C3.90607@pacific.edu>
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
To: Ken Hughes <khughes@pacific.edu>
Cc: cpufreq <Cpufreq@www.linux.org.uk>

On Thu, Jun 03, 2004 at 11:02:43AM -0700, Ken Hughes wrote:
> Bruno Ducrot wrote:
> >Hi,
> >
> >On Thu, Jun 03, 2004 at 07:32:38AM -0700, Ken Hughes wrote:
> >
> >>I've got a Presario with an AMD XP-M 3000+ CPU (a 32-bit K8).
> >
> >You have a AMD64 ?
> >
> .....
> >>
> >>> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 
> >>1.20.08b - March 20, 2004)
> >>> powernow-k8: Too many lo freq table entries
> >>> powernow-k8: BIOS error - no PSB
> >
> >Then it's AMD64, not an XP-M (or else powernow-k8 would not print
> >that it found a AMD64 or an Opteron I believe).
> >
> >To be sure, what say /proc/cpuinfo ?
> 
> It's an AMD64/K8 core, but 32-bit only:
> http://www.theinquirer.net/?article=14578

What's that?  Will look at amd site then.

Ok, you have that in a SSDT :

    Name (_PSS, Package (0x03)
    {
        Package (0x06)
        {
            0x00000640, 
            0x0000F230, 
            0x00000064, 
            0x00000006, 
            0xE0202988, 
            0x00000188
        }, 

        Package (0x06)
        {
            0x00000320, 
            0x000032C8, 
            0x00000064, 
            0x00000006, 
            0xE0202E00, 
            0x00000600
        }, 

        Package (0x06)
        {
            0x00000320, 
            0x000032C8, 
            0x00000064, 
            0x00000006, 
            0xE0202E00, 
            0x00000600
        }
    })


The last two states are *exactly* the same.  Then powernow-k8 complains that
there is 2 low states (which is not supported, as Paul will tell us).
Then the driver fail.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
