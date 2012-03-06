From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: Re: [linux-pm] [PATCH 0/2] RFC: CPU frequency max as PM QoS param
Date: Tue, 06 Mar 2012 14:23:52 +0200
Message-ID: <87399lvrxj.fsf@amiettinen-lnx.nvidia.com>
References: <87d39fk2n3.fsf@ti.com> <20120228005630.GA15348@envy17>
	<87ty2b5mdo.fsf@amiettinen-lnx.nvidia.com>
	<201203042346.54468.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201203042346.54468.rjw@sisk.pl> (Rafael J. Wysocki's message of
	"Sun, 4 Mar 2012 23:46:54 +0100")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: markgross@thegnar.org, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, cpufreq List <cpufreq@vger.kernel.org>, j-pihet <j-pihet@ti.com>, pavel@ucw.cz, Linux PM list <linux-pm@vger.kernel.org>

"Rafael J. Wysocki" <rjw@sisk.pl> writes:
> On Tuesday, February 28, 2012, Antti P Miettinen wrote:
[..]
>> So what do other people think? Could we merge global CPU frequency
>> constraints for now?
>
> Not without an ACK from Dave (the cpufreq maintainer), that's for sure.

Dave - any comments about these?

http://thread.gmane.org/gmane.linux.kernel.cpufreq/7794
http://thread.gmane.org/gmane.linux.kernel.cpufreq/7797
http://thread.gmane.org/gmane.linux.kernel.cpufreq/7800

>> I agree that more work is needed for e.g. per CPU constraints, user
>> space interface and more complete thermal management. Actually for
>> future I think the constraints could also become more general than just
>> min/max "reduction operators". For e.g. core online status you might
>> want union/intersection of bitmaps. Also, the more complete thermal
>> management is related to load management in general (power budgeting for
>> other reasons than just thermal).
>
> Then perhaps let's not merge "temporary" stuff and figure out how to
> implement what we _really_ want.

Well, I'd say "partial" instead of "temporary". I think frequency min
and max are really needed but as discussed, they are hardly a complete
solution for power management.

	--Antti
