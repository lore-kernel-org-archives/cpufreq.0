From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: kernel 2.4.27; Pentium M 1.8
Date: Fri, 6 May 2005 11:34:29 +0200
Message-ID: <20050506093429.GC21800@poupinou.org>
References: <200505060027.22704.jove@newmail.ru>
	<20050505220457.GA16100@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050505220457.GA16100@isilmar.linta.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

On Fri, May 06, 2005 at 12:04:57AM +0200, Dominik Brodowski wrote:
> Hi,
> On Fri, May 06, 2005 at 12:27:22AM +0400, Vladimir Skokov wrote:
> > Hello.
> > 
> > I have applied  cpufreq patch for kernel 2.4.27. However I have some issue 
> > with loading  speedstep modules? Can you help?  Thanks in advance. 
> 
> This CPU is only supported by the speedstep-centrino module if the ACPI
> performance states library is used -- and that is only available for 2.6.,
> AFAIK. Therefore, cpufreq isn't available for this CPU on 2.4.

I'm working on this issue, but I can't promise when this will available.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
