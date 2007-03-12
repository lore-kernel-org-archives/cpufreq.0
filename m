From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq on Debian, problems
Date: Mon, 12 Mar 2007 14:18:50 -0400
Message-ID: <20070312181850.GE22223@redhat.com>
References: <553837380703111304m4aea8cbcufdc5da4261e41895@mail.gmail.com>
	<45F47282.4020209@chrestomanci.org>
	<553837380703121048ybaeb9ceqc146129adb2e5e03@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <553837380703121048ybaeb9ceqc146129adb2e5e03@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Justice <joshj777@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Mar 12, 2007 at 01:48:39PM -0400, Joshua Justice wrote:
 > On 3/11/07, David Pottage <david@chrestomanci.org> wrote:
 > >
 > > Take a look in
 > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors that
 > > they are there, then echo a govenor name into
 > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
 > 
 > 
 > 
 > This may be my problem right here. There's no /cpufreq/ directory in my cpu0
 > and cpu1 directories.

Your CPU doesn't support speedstep.
The only option available to the P4's without EST is 'p4-clockmod' which
doesn't actually scale speed, but inserts wait states every n cycles,
making jobs take longer to complete, which in some cases can reduce heat.
If you're seeing overheating problems whilst idle however, it sounds like
you have more fundamental problems such as a poorly fitted fan as Len suggested.

	Dave

-- 
http://www.codemonkey.org.uk
