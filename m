From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: 2.4 kernel patch on debian source 2.4.22
Date: Wed, 22 Oct 2003 10:21:47 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031022082147.GL13989@poupinou.org>
References: <002b01c39676$43910270$0100a8c0@bert>
	<1066607136.1501.16.camel@carryme.shs>
	<200310202135.43943.snowfire@blueyonder.co.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200310202135.43943.snowfire@blueyonder.co.uk>
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
To: Edward Macfarlane Smith <snowfire@blueyonder.co.uk>
Cc: Lars Weissflog <L@rs-w.de>, cpufreq@www.linux.org.uk

On Mon, Oct 20, 2003 at 09:35:43PM +0100, Edward Macfarlane Smith wrote:
> I think you just need to add in all the lines that have a "+" without the plus 
> to the original file after the line with "obj-$(CONFIG_X86_VISWS_APIC)  += 
> visws_apic.o". There are 4 files that mess up in a similar way if you apply 
> the patch from the weekend to the 2.4.23-pre7 kernel. It's some other changes 
> that upset the patch.
> I presume the cpufreq patch will be updated soon, but if anyone really needs 
> it I can mail them the modified patches.
> Regards,
> Edward

You may try to see -pac kernels at /pub/linux/kernel/people/bero/2.4/
since this guy try to maintain -ac series.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
