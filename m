From: Dave Jones <davej@redhat.com>
Subject: Re: [linux-pm] [PATCH 0/2] RFC: CPU frequency max as PM QoS param
Date: Tue, 6 Mar 2012 09:37:29 -0500
Message-ID: <20120306143729.GB29474@redhat.com>
References: <87d39fk2n3.fsf@ti.com>
 <20120228005630.GA15348@envy17>
 <87ty2b5mdo.fsf@amiettinen-lnx.nvidia.com>
 <201203042346.54468.rjw@sisk.pl>
 <87399lvrxj.fsf@amiettinen-lnx.nvidia.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87399lvrxj.fsf@amiettinen-lnx.nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, markgross@thegnar.org, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, cpufreq List <cpufreq@vger.kernel.org>, j-pihet <j-pihet@ti.com>, pavel@ucw.cz, Linux PM list <linux-pm@vger.kernel.org>

On Tue, Mar 06, 2012 at 02:23:52PM +0200, Antti P Miettinen wrote:
 > "Rafael J. Wysocki" <rjw@sisk.pl> writes:
 > > On Tuesday, February 28, 2012, Antti P Miettinen wrote:
 > [..]
 > >> So what do other people think? Could we merge global CPU frequency
 > >> constraints for now?
 > >
 > > Not without an ACK from Dave (the cpufreq maintainer), that's for sure.
 > 
 > Dave - any comments about these?
 > 
 > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7794
 > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7797
 > http://thread.gmane.org/gmane.linux.kernel.cpufreq/7800

I really dislike how this is exposed to userspace.
How is a user to know whether scaling_max_freq or cpu_freq_max takes priority ?
Given the confusion we already have from users when the bios_limit enforces limits,
giving them two knobs to do the same thing seems like a bad idea to me.

I don't see what problem this is solving that you couldn't solve just by
setting scaling_max_freq.

	Dave

