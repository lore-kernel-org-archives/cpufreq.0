From: Nebojsa Trpkovic <trxman@gmail.com>
Subject: high "hi" usage and hang
Date: Tue, 15 Mar 2005 11:04:39 +0100
Message-ID: <4236B337.6080703@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

I've got my system very very slow in one moment, saw "98% hi" in top and 
next moment system completely hanged. All hapened after turning on 
powernow-k8 and trying to compile some large gentoo packages.

Is this cpufreq-related at all?

> Mar 15 10:49:55 master bad: scheduling while atomic!
> Mar 15 10:49:55 master
> Mar 15 10:49:55 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:49:55 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:49:55 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:49:55 master bad: scheduling while atomic!
> Mar 15 10:49:55 master
> Mar 15 10:49:55 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:49:55 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:49:55 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:49:55 master bad: scheduling while atomic!
> Mar 15 10:49:55 master
> Mar 15 10:49:55 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:49:55 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:49:55 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:27 master bad: scheduling while atomic!
> Mar 15 10:50:27 master
> Mar 15 10:50:27 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:27 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:27 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:27 master bad: scheduling while atomic!
> Mar 15 10:50:27 master
> Mar 15 10:50:27 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:27 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:27 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:27 master /usr/sbin/cron[14337]: (root) CMD (nice -n 19 
> /root/skripte/rrd_update.pl)
> Mar 15 10:50:27 master /usr/sbin/cron[14339]: (root) CMD (test -x 
> /usr/sbin/run-crons && /usr/sbin/run-crons )
> Mar 15 10:50:29 master bad: scheduling while atomic!
> Mar 15 10:50:29 master
> Mar 15 10:50:29 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:29 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:29 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:29 master su(pam_unix)[13662]: session closed for user root
> Mar 15 10:50:30 master bad: scheduling while atomic!
> Mar 15 10:50:30 master
> Mar 15 10:50:30 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:30 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:30 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:32 master bad: scheduling while atomic!
> Mar 15 10:50:32 master
> Mar 15 10:50:32 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:32 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:32 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:33 master bad: scheduling while atomic!
> Mar 15 10:50:33 master
> Mar 15 10:50:33 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:33 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:33 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:33 master bad: scheduling while atomic!
> Mar 15 10:50:33 master
> Mar 15 10:50:33 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:33 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:33 master <ffffffff804d51d3>{_sinittext+467}
> Mar 15 10:50:33 master bad: scheduling while atomic!
> Mar 15 10:50:33 master
> Mar 15 10:50:33 master Call Trace:<ffffffff8039ed5e>{schedule+94} 
> <ffffffff8010d610>{default_idle+0}
> Mar 15 10:50:33 master <ffffffff8010d70b>{cpu_idle+107} 
> <ffffffff804d58df>{start_kernel+495}
> Mar 15 10:50:33 master <ffffffff804d51d3>{_sinittext+467}
