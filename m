From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: supported x86 processors?
Date: Mon, 1 Mar 2004 20:08:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040301190814.GZ2869@poupinou.org>
References: <20040301155817.GV2869@poupinou.org>
	<200403011750.i21HoZWC010926@localhost.localdomain>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200403011750.i21HoZWC010926@localhost.localdomain>
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
To: Franco <net.surfer@tiscalinet.it>
Cc: cpufreq@www.linux.org.uk

On Mon, Mar 01, 2004 at 06:50:34PM +0100, Franco wrote:
> Thanks a lot for the answer.
> 
> Then, the candidates for my application are K7 and non-VIA, non-SiS
> Speeddstep. (K6, K8, VIA C3 are too slow or too expensive).
> 
> > Note that some driver do not support voltage scaling
> > You may take a look to arch/i386/kernel/cpu/cpufreq/ 
> 
> I took a look at the code.
> As to K7, the only mention to voltage are a couple of printk().
> As to P4, I'm not sure I've understood correctly, but seems me
> that voltage scaling is only for mobile chips, is it right?
> 
> Then, as my application is a desktop PC, are K7 and P4 equivalent?
> (relatively to voltage/frequency scaling)
> 
> Or, is there a chance that one of the two 
> will also get voltage scaling in the future?
> 

Well, I don't think that Intel will release a desktop version of a p4 or
a banias (the one found in the centrino platform), but there exist micro
atx cards with mobile processors.
For example, the Radisys Pentium M microATX
http://www.radisys.com/oem_products/ds-page.cfm?productdatasheetsid=1158
is a good choice, and really the banias is one of the best IMHO a that time
for power consuption issues (note that I don't work for radisys, nor intel :)
and can run at 1.6 GHz.  Banias are supported by the speedstep-centrino
driver.

Of course, the k7 is good choice, but you have to check twice that the
motherboard do have a VRM that permit to change voltages.  Not all
motherboards have such VRM, so be carrefull before you buy one.

You may also consider the eden processor from VIA, it is not supported
by cpufreq, but I think it should be in the future.  But perhaps it is
too slow for what you want to do (1 GHz)?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
