From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Wed, 05 Mar 2008 08:02:16 -0800
Message-ID: <47CEC408.2070604@zytor.com>
References: <200803051559.09962.langer_mann@web.de>
	<20080305153520.GB19300@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080305153520.GB19300@elte.hu>
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
To: Ingo Molnar <mingo@elte.hu>
Cc: davej@codemonkey.org.uk, Stephan Diestelhorst <langer_mann@web.de>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Ingo Molnar wrote:
> * Stephan Diestelhorst <langer_mann@web.de> wrote:
> 
>> @@ -184,7 +184,7 @@ static void speedstep_set_state (unsigne
>>  		__asm__ __volatile__(
>>  			"movl $0, %%edi\n"
>>  			"out %%al, (%%dx)\n"
>> -			: "=b" (new_state), "=D" (result)
>> +			: "=b" (new_state), "=D" (result), "=c" (ecx_clobber)
>>  			: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
>>  			);
> 
> stupid suggestion: why not do a pusha/popa around those instructions, to 
> make sure everything is restored? This isnt a fastpath and being 
> conservative about SMI side-effects cannot hurt ...
> 

You can't pusha/popa if you expect a result.  You can, of course, push 
and pop individual registers.

It's also kind of odd to do "movl $0,%%edi" instead of just setting EDI 
as an input.

	-hpa
