From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: starting governor ondemand failed
Date: Mon, 4 Apr 2005 14:43:04 +0200
Message-ID: <20050404124304.GA17732@isilmar.linta.de>
References: <42511A0B.1070008@ivor.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <42511A0B.1070008@ivor.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivor Hewitt <ivor@ivor.org>
Cc: cpufreq@lists.linux.org.uk

On Mon, Apr 04, 2005 at 11:42:19AM +0100, Ivor Hewitt wrote:
> Hi,
> I was trying to have a play with the ondemand governor but I just get 
> the following logged when I try to switch to it:-
> 
> cpufreq-core: governor switch
> cpufreq-core: __cpufreq_governor for CPU 0, event 2
> userspace: managing cpu 0 stopped
> cpufreq-core: __cpufreq_governor for CPU 0, event 1
> cpufreq-core: starting governor ondemand failed
> cpufreq-core: __cpufreq_governor for CPU 0, event 1
> 
> This is on a PIIIM using the speedstep-smi interface.
> The cpu is only capable of switching between two frequencies, would this 
> prevent ondemand starting up?

This isn't the problem, but the following: we do not know how long 
transitions using speedstep-smi take, therefore we still need to assume
that it takes very long, thus making it unable to be used for ondemand
frequency switching.

	Dominik
