From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: Re: [linux-pm] [PATCH 0/2] RFC: CPU frequency max as PM QoS param
Date: Wed, 07 Mar 2012 08:38:40 +0200
Message-ID: <8762egyky7.fsf@amiettinen-lnx.nvidia.com>
References: <87d39fk2n3.fsf@ti.com> <20120228005630.GA15348@envy17>
	<87ty2b5mdo.fsf@amiettinen-lnx.nvidia.com>
	<201203042346.54468.rjw@sisk.pl>
	<87399lvrxj.fsf@amiettinen-lnx.nvidia.com>
	<20120306143729.GB29474@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120306143729.GB29474@redhat.com> (Dave Jones's message of
	"Tue, 6 Mar 2012 09:37:29 -0500")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, markgross@thegnar.org, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, cpufreq List <cpufreq@vger.kernel.org>, j-pihet <j-pihet@ti.com>, pavel@ucw.cz, Linux PM list <linux-pm@vger.kernel.org>

Dave Jones <davej@redhat.com> writes:
> On Tue, Mar 06, 2012 at 02:23:52PM +0200, Antti P Miettinen wrote:
[..]
>  > Dave - any comments about these?
>  > 
>  > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7794
>  > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7797
>  > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7800
>
> I really dislike how this is exposed to userspace.
> How is a user to know whether scaling_max_freq or cpu_freq_max takes
> priority ? Given the confusion we already have from users when the
> bios_limit enforces limits, giving them two knobs to do the same thing
> seems like a bad idea to me.
>
> I don't see what problem this is solving that you couldn't solve just by
> setting scaling_max_freq.
>
> 	Dave

PM QoS handles multiple clients - the sysfs files are like global
variables: there is no arbitration/consolidation for multiple
clients. The sysfs files are a sort of override for system administrator
whereas the PM QoS is the interface applications should use.

	--Antti
