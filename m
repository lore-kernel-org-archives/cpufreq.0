From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: Pentium D 915 support
Date: Thu, 03 Aug 2006 19:51:41 +0400
Message-ID: <44D21B8D.8030204@linux.intel.com>
References: <1154265136.21063.10.camel@skylla.slagter.name>	
	<44CCD154.3080606@linux.intel.com>	
	<1154275129.21063.31.camel@skylla.slagter.name>	
	<1154605493.4302.494.camel@queen.suse.de>	
	<1154605725.14206.22.camel@localhost>	
	<1154617009.4302.515.camel@queen.suse.de>	
	<44D21666.5030304@linux.intel.com>
	<1154619193.23310.6.camel@skylla.slagter.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154619193.23310.6.camel@skylla.slagter.name>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

Erik Slagter wrote:
> On do, 2006-08-03 at 19:29 +0400, Alexey Starikovskiy wrote:
>>> This could be intended (avoid possible performance losses), but also
>>> just be a BIOS bug.
>> This is not BIOS bug, it is just a way to avoid dynamic memory allocation in BIOS.
>> And it has nothing to do with performance losses due to note above.
> 
> BTW Is there intention to correct the output of
> cat /proc/acpi/processor/CPU?/performance as well?
Intention was to keep it as reference of BIOS output, so no, there is no intention to correct it, unless you give a
reason to do that.
