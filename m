From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5383] New: VIA Nehemiah ondemand scaling governor critical DMA
	error
Date: Thu, 6 Oct 2005 11:06:55 -0700
Message-ID: <200510061806.j96I6tZ7001324@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5383

           Summary: VIA Nehemiah ondemand scaling governor critical DMA
                    error
    Kernel Version: 2.6.13
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: fabio.erculiani@gmail.com


Most recent kernel where this bug did not occur: If cpufreq governor is  
performance (powersave and conservative not tested)  
Distribution: Gentoo GNU/Linux  
Hardware Environment: VIA C3 mini-itx board  
Software Environment: /  
Problem Description:   
After 2 days of headache, I've realized that on my VIA C3 mini-itx board if I  
use ondemand power governor, I can't use IDE devices with DMA. If I set 
performance, no problems. 
  
Steps to reproduce: Use a VIA C3 Nehemiah with the hardware listed below 
(lspci) and enable ondemand cpufreq scaling governor. 
 
Hardware info: http://www.lxnay.scarlet.nl/kernel/nehemiah.tar.bz2

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
