From: Dave Jones <davej@redhat.com>
Subject: Re: [linux-pm] [PATCH 0/2] RFC: CPU frequency max as PM QoS param
Date: Wed, 7 Mar 2012 11:59:57 -0500
Message-ID: <20120307165957.GA23690@redhat.com>
References: <87d39fk2n3.fsf@ti.com>
 <20120228005630.GA15348@envy17>
 <87ty2b5mdo.fsf@amiettinen-lnx.nvidia.com>
 <201203042346.54468.rjw@sisk.pl>
 <87399lvrxj.fsf@amiettinen-lnx.nvidia.com>
 <20120306143729.GB29474@redhat.com>
 <8762egyky7.fsf@amiettinen-lnx.nvidia.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8762egyky7.fsf@amiettinen-lnx.nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, markgross@thegnar.org, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, cpufreq List <cpufreq@vger.kernel.org>, j-pihet <j-pihet@ti.com>, pavel@ucw.cz, Linux PM list <linux-pm@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Wed, Mar 07, 2012 at 08:38:40AM +0200, Antti P Miettinen wrote:
 > Dave Jones <davej@redhat.com> writes:
 > > On Tue, Mar 06, 2012 at 02:23:52PM +0200, Antti P Miettinen wrote:
 > [..]
 > >  > Dave - any comments about these?
 > >  > 
 > >  > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7794
 > >  > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7797
 > >  > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7800
 > >
 > > I really dislike how this is exposed to userspace.
 > > How is a user to know whether scaling_max_freq or cpu_freq_max takes
 > > priority ? Given the confusion we already have from users when the
 > > bios_limit enforces limits, giving them two knobs to do the same thing
 > > seems like a bad idea to me.
 > >
 > > I don't see what problem this is solving that you couldn't solve just by
 > > setting scaling_max_freq.
 > 
 > PM QoS handles multiple clients - the sysfs files are like global
 > variables: there is no arbitration/consolidation for multiple
 > clients. The sysfs files are a sort of override for system administrator
 > whereas the PM QoS is the interface applications should use.

I think exposing absolute frequencies to applications is a mistake.
(And one that the core cpufreq made a long time ago). How is an application
to decide what to set it to without knowledge of the hardware it's running on ?

I much prefer the idea that was mentioned a few weeks ago during the
discussion with Peter Zijlstra about cpufreq being more connected to
the scheduler, and essentially having per-process governors.

Each process gets a /proc/self/power-policy
This can be 'performance' 'power-save' or 'ondemand'
 - A global sysfs knob sets the default new processes get.
 - Processes can adjust it themselves if desired.
 - There's no need for a system-wide governor any more.

There are some open questions about how this could work.

- A list of rules for desired behaviour when performing state changes
  when switching between tasks with different policies is needed.

- We don't want to be doing power transitions every context switch,
  or switching overhead will be brutal.
  So some kind of lazy state changing may be necessary.

- For 'ondemand', when would the scheduler decide to ramp up/down
  the speed ?

	Dave

