From: Franco <net.surfer@tiscalinet.it>
Subject: Re: supported x86 processors?
Date: Mon, 1 Mar 2004 18:50:34 +0100 (CET)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200403011750.i21HoZWC010926@localhost.localdomain>
References: <20040301155817.GV2869@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040301155817.GV2869@poupinou.org> from "Bruno Ducrot" at Mar
	01, 2004 04:58:17 PM
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
Cc: cpufreq@www.linux.org.uk

Thanks a lot for the answer.

Then, the candidates for my application are K7 and non-VIA, non-SiS
Speeddstep. (K6, K8, VIA C3 are too slow or too expensive).

> Note that some driver do not support voltage scaling
> You may take a look to arch/i386/kernel/cpu/cpufreq/ 

I took a look at the code.
As to K7, the only mention to voltage are a couple of printk().
As to P4, I'm not sure I've understood correctly, but seems me
that voltage scaling is only for mobile chips, is it right?

Then, as my application is a desktop PC, are K7 and P4 equivalent?
(relatively to voltage/frequency scaling)

Or, is there a chance that one of the two 
will also get voltage scaling in the future?

Thank you a lot in advance,
Franco
