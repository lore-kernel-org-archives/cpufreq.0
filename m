From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: Re: [RFC PATCH 1/2] PM / OPP: add support to specify phandle of another
 node for OPP
Date: Tue, 20 Aug 2013 17:07:01 +0100
Message-ID: <52139425.1000709@arm.com>
References: <51F8F17B.1020304@arm.com> <51F9234A.6010501@ti.com> <20130731152925.GP29859@e106331-lin.cambridge.arm.com> <51F9341E.60102@ti.com> <20130731161103.GS29859@e106331-lin.cambridge.arm.com> <51F93AFB.1030104@ti.com> <20130801135422.GA8095@e106331-lin.cambridge.arm.com> <51FA8BE2.9000309@ti.com> <20130802131541.GN2884@e106331-lin.cambridge.arm.com> <20130806134534.GB6603@kahuna> <20130807161722.GJ28558@e106331-lin.cambridge.arm.com> <52133E26.1000801@arm.com> <5213769D.9020804@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <5213769D.9020804@ti.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nishanth Menon <nm@ti.com>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

On 20/08/13 15:01, Nishanth Menon wrote:
> On 08/20/2013 05:00 AM, Sudeep KarkadaNagesha wrote:
[...]
>> Until we get more feedback and agreement on new proposal can we have
>> this simple amendment in this patch to the existing binding ? Since the
>> new proposal[1] is backward compatible(this patch adding support for
>> option#5 to existing option#1), we will have to add support for other
>> binding options in [1] later.
>>
>> This is needed to support shared OPPs with simple/single OPP profile
>> and also to fix the broken and unused binding
>> @Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt
>>
>> Regards,
>> Sudeep
>>
>> [1] http://www.spinics.net/lists/cpufreq/msg06563.html
> 
> 
> Could you post a non-RFC version of this series? As I had mentioned
> earlier in the thread, I dont mind having this pulled in as stage 1 of
> the transition to a more elaborate solution.
> 
Thanks Nishanth. I would wait till Mark and Stephen agree for this approach.

Regards,
Sudeep

