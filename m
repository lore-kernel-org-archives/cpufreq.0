From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: cpufreq question
Date: Wed, 14 May 2008 14:44:04 -0400
Message-ID: <200805141444.05019.jwilson@redhat.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk
Cc: "Frazier, John" <j-frazier2@ti.com>

On Wednesday 14 May 2008 02:28:02 pm Frazier, John wrote:
> I am new to Linux and I am having a little problem with my cpu power
> saving.
>
> Kernel: 2.6.9-67.0.4.ELsmp
>
> I am using cpuspeed to control my cpus and I have just upgraded to a
> newer version of it and it is looking for the file
> /sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus.
>
> This file does not exist on my system. What is the correct way to
> resolve this issue?

Probably best to file a bug at bugzilla.redhat.com for issues on a RHEL4 
system -- wildly divergent from upstream by now. :) Will need some additional 
info though, along the lines of what cpu(s) you have, what architecture and 
what cpuspeed version and/or kernel-utils version you have 
('rpm -qf /etc/init.d/cpuspeed' should get the right answer).

-- 
Jarod Wilson
jwilson@redhat.com
