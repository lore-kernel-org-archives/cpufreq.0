From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: cpufreq CVS [Was: Re: cpufreq and P-IIIM]
Date: Tue, 19 Aug 2003 16:57:53 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F423AF1.90607@basmevissen.nl>
References: <m2ptj5fiuc.fsf@tnuctip.rychter.com> <20030818112943.GD18032@poupinou.org> <m2vfsux5ju.fsf@tnuctip.rychter.com> <20030818190710.C1737@flint.arm.linux.org.uk> <20030818182137.GA2296@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030818182137.GA2296@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@brodo.de>
Cc: Jan Rychter <jan@rychter.com>, Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

Dominik Brodowski wrote:
> 

Ah, I forgot about this information. Hence my misinterpretation of 
Duncrot's submits.

> AFAICS, 
> a) the 2.6. branch development is done in Dave's BK tree. 
> b) 2.4-new [== backport of 2.6. to 2.4.] was never done in CVS,
> c) 2.4-ac tags exist, but because of b) are not kept up to date,
> d) depending on the outcome of the ARM and cpufreq-2.4. issue,
>    2.4-stable [which is CVS LINUX_2_4] is going to be deprecated soon.
> 
> Also, it is my impression that an external CVS tree is used far less if a
> feature is merged into a mainline kernel. If it's not in the kernel, keeping
> track of a project without something like CVS is impossible. So I'm really
> glad about having had cpufreq-CVS and FTP-archives available. But, for the
> future, I don't see such a strong reason for keeping it.
> 

Agree. Can you put the 2.4 backport in CVS? Then Duncrot's changes can 
be merged in a structured manner.

Russell, can you update the documentation on 
<http://www.arm.linux.org.uk/cvs/> for cpufreq when things have settled?

(this is just a proposal, please comment)

CPU clock frequency and voltage scaling for Linux, for x86 and ARM based 
processors. This module provides a user-space and standard kernel-space 
interface to these features, allowing ARM system-on-a-chip devices and 
x86 platforms to cope with processor clock speed and cpu voltage 
changes. Because not all combinations of clock speed and cpu voltage 
changes are allowed, tables with valid combinations are included for 
certain processors are included with the module.

Since the power consumed by a processor is directly related to the speed 
and voltage at which it is running, keeping the clock speed and voltage 
as low as possible allows you to get more run-time out of your battery 
and lower the dissipation (heat) of your computer. Some people use this 
to adjust their clock speed many times a second to optimise performance 
vs battery life.

Most up to date documentation is included in the module directory 
linux/Documentation/cpufreq

The following branches are available:

LINUX_2_4            - Stable older implementation for 2.4 kernels. 
(might die soon)
LINUX_2_4_BACKPORT   - Backport of 2.5/2.6 implementation
LINUX_2_5            - for 2.5 and upcoming 2.6 kernels. (main branch???)

(we could reuse LINUX_2_4 for the backport if the ARM guys don't need 
the old implementation any more).

Regards,

Bas.
