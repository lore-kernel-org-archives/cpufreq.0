From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6370] cpufreq problems on Pentium-M
Date: Thu, 13 Apr 2006 03:45:02 -0700
Message-ID: <200604131045.k3DAj20q003740@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6370

trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED



------- Additional Comments From trenn@suse.de  2006-04-13 03:45 -------
Someone asked me whether the patches are save for backporting to a stable     
kernel. Not sure whether this had happened. Be sure all 4 patches (stated in     
bug #6331) get added.   
I fixed that on a DELL 600. I am quite sure this also fixes other DELL   
models(DELL 660 - this one, bug #6266 and bug #6166, Dell inspiron 9300 - bug 
#6331, Dell Latitude D800 - bug #6376). 
See bug #6331 for further description. 
I can't mark the bugs as a duplicates, so I will close them all with a note to 
verify the fix for recent kernels. 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
