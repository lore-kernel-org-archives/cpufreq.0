From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [ANNOUNCE] cpufrequtils-0.1-pre3
Date: Sun, 21 Nov 2004 19:55:02 +0100
Message-ID: <20041121185502.GA9158@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi all,

cpufrequtils-0.1-pre3 is out and available at

http://www.brodo.de/cpufreq/cpufrequtils-0.1-pre3.tar.bz2 (~400KB)

Changes since -pre2 include i18n support for French and a intel_gsic dump
program for speedstep-smi by Bruno Ducrot as well as an update to cpufreq.h
so that C++ programs can be linked against libcpufreq.

Note that you need a working "lrmi" library to compile intel_gsic; the debug
tools and modules aren't built by default, you need to manually enter the
debug/{i386,kernel,x86_64} directory and do a "make" there.

	Dominik
