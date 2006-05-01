From: Diederick de Vries <diederick@diederickdevries.net>
Subject: compiling fails
Date: Mon, 1 May 2006 21:08:53 +0200
Message-ID: <200605012108.53297.diederick@diederickdevries.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi everyone

I'm trying to compile cpufreq, but 

./configure 

fails after:

checking for sysfs/libsysfs.h... no
*********************************************************************
***            ERROR WHILE CONFIGURING LIBCPUFREQ                 ***
***     Failed to detect libsysfs header files and/or library     ***
*********************************************************************
*********************************************************************
***            ERROR WHILE CONFIGURING LIBCPUFREQ                 ***
*** At least one of /sys support or /proc support MUST be enabled ***
*********************************************************************
configure: error: At least one of /sys support or /proc support MUST be 
enabled
configure: error: /bin/sh './configure' failed for libcpufreq

However, I have SYSFS and PROC_FS both enabled in my kernel (v2.6.16) and I 
have have sysfsutils installed in /usr/lib (header files are 
in /usr/include/sysfs). Why can't the configure script find this?

Thanks for any help,
Diederick de Vries.
