From: Mattia Dongili <dongili@supereva.it>
Subject: [ANNOUNCE] cpufreqd-1.0 released
Date: Mon, 23 Jun 2003 21:24:04 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030623212404.6fb4f05d.dongili@supereva.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hello,

here I am with my version of a CPUFreq daemon :) [should we merge some
of them in a more complete daemon?]

I didn't receive many bug reports on the beta1 release and I found some
time to work out a couple of other details, so here is 1.0 :)

It doesn't contain big changes except that if you where using it with
APM and had problems with cpufreqd you'd better try this release.

cpufreqd is meant to be a replacement of the speedstep applet you can
find on some other OS, it monitors battery level, AC state and running
programs and adjusts the frequency governor according to a set of rules
specified in the config file. In the near future I'll add support for
its own policies using the userspace governor.

I'll create a debian package as soon as I'll finish reading all the
debian-policy stuff.

You can find the sources at http://www.sf.net/projects/cpufreqd

thanks everybody
-- 
mattia
