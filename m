From: Joseph Pingenot <trelane@digitasaru.net>
Subject: Re: enhanced intel speedstep feature was Re: speedstep-centrino on
	dothan
Date: Thu, 7 Jul 2005 16:34:14 -0500
Message-ID: <20050707213414.GF16702@digitasaru.net>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
	<20050707220027.413343d4@horst.morte.male>
	<20050707200648.GA29142@redhat.com>
	<20050707222225.5b3113e0@horst.morte.male>
	<20050707205117.GB10635@digitasaru.net>
	<20050707210823.GA24774@isilmar.linta.de>
Reply-To: trelane@digitasaru.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050707210823.GA24774@isilmar.linta.de>
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
To: st3@riseup.net, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

From Dominik Brodowski on Thursday, 07 July, 2005:
>On Thu, Jul 07, 2005 at 03:51:17PM -0500, Joseph Pingenot wrote:
>> >Just a latest question: can be p4-clockmod used together with
>> >speedstep-centrino? If not, would it make any sense to patch
>> >speedstep-centrino to use this feature too?
>> I'm a little confused.  How is this different from the ACPI CPU throttling
>>   states (/proc/acpi/processor/CPUn/limit to set, throttling to see all
>>   T-states available)?
>T-states _tend_ to be utilized using chipset logic, while p4-clockmod is
>done in-CPU.
>> On my 1.5-year-old Pentium-M, frequency scaling and T-states are different
>>   beasties, and act entirely differently.  I'm currently in the process of
>>   rewriting my governor's brain to deal with the two more intelligently.
>In your case, I would care about throttling. In very most cases it actually
>increases energy consumption, as the state being entered is technically the
>same to ACPI C2 (IIRC), so it is only "forced" idling and only useful if
>"forced" idling is needed to not need active cooling.

Why would this cause more energy consumption?

-Joseph

-- 
trelane@digitasaru.net--------------------------------------------------
          Graduate student in physics, Free Software developer.
