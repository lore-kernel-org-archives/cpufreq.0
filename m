From: Rich Townsend <rhdt@bartol.udel.edu>
Subject: Re: Dothan VID# identification script (was Re: [ACPI]
 Speedstep-centrino problems)
Date: Sun, 20 Feb 2005 09:23:12 -0500
Message-ID: <42189D50.8020501@bartol.udel.edu>
References: <88056F38E9E48644A0F562A38C64FB60040DBAD8@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60040DBAD8@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@ZenII.linux.org.uk, Simon Moore <Simon_Moore@condisline.com>, Dominik Brodowski <linux@dominikbrodowski.net>

Pallipadi, Venkatesh wrote:
>>-----Original Message-----
>>From: cpufreq-bounces@ZenII.linux.org.uk 
>>[mailto:cpufreq-bounces@ZenII.linux.org.uk] On Behalf Of Rich Townsend
>>Sent: Sunday, February 13, 2005 6:12 AM
>>To: Dominik Brodowski
>>Cc: cpufreq@ZenII.linux.org.uk; Simon Moore
>>Subject: Re: Dothan VID# identification script (was Re: [ACPI] 
>>Speedstep-centrino problems)
>>
>>Dominik Brodowski wrote:
>>
>>>On Sat, Feb 12, 2005 at 06:28:27PM -0500, Rich Townsend wrote:
>>>
>>>
>>>>Of course, we can't guarantee that there will always be a 
>>
>>match; or that 
>>
>>>>there won't be duplicate matches. Also, this approach relies 
>>
>>on having 
>>
>>>>ACPI P-states, to build up the frequency/voltage table. However, it 
>>>>still seems to me to be a pretty robust way of determining 
>>
>>the VID# in a 
>>
>>>>system, and one that could be incorporated into speedstep-centrino. 
>>>>Dominik, what do you think?
>>>
>>>
>>>It indeed seems somewhat robust to me, I'd like to get 
>>
>>Venkatesh's input on
>>
>>>this, though. "Transient voltages" may pose a problem, though...
>>
>>Gak, hadn't thought of that.
>>
> 
> 
> Actually, if you use CNTL MSR in place of STATUS MSR, you don't have to
> worry about transients.

OK! What is the offset of the CNTL MSR? And does it decode to a 
freq/voltage pair in the same way as STATUS?

On a related note, is there a simple way to set the CPU to its maximum 
frequency, without having to know what the associated voltage is?

cheers,

Rich
