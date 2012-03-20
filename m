From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: Using out of band messages to change min/max frequencies
Date: Tue, 20 Mar 2012 09:32:55 -0500
Message-ID: <4F689517.8090809@calxeda.com>
References: <4F60D71C.6070709@calxeda.com> <878vj0v1uh.fsf@amiettinen-lnx.nvidia.com>	<4F63A8FA.2070406@calxeda.com> <87y5qyt1uu.fsf@amiettinen-lnx.nvidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <87y5qyt1uu.fsf@amiettinen-lnx.nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 03/18/2012 09:34 AM, Antti P Miettinen wrote:
> Mark Langsdorf <mark.langsdorf@calxeda.com> writes:
>> On 03/16/2012 01:26 PM, Antti P Miettinen wrote:
>>> Mark Langsdorf <mark.langsdorf@calxeda.com> writes:
>>>> Is there some better way to approach this?
>>>
>>> PM QoS :-)
>>>
>>> http://thread.gmane.org/gmane.linux.kernel.cpufreq/7794
>>> http://thread.gmane.org/gmane.linux.kernel.cpufreq/7797
>>
>> Thanks, that looks like it could be useful.
>>
>> Is there a sample implementation of this in the context of
>> a cpufreq device driver?
> 
> Hmm.. controlling cpufreq core from cpufreq driver? Nope, this input
> event booster is the only example I have:
> 
> http://thread.gmane.org/gmane.linux.kernel.cpufreq/7801

Thanks. It wasn't exactly applicable, but it gave enough
hints that I got the QoS parts working for my driver.

--Mark Langsdorf
Calxeda, Inc.

